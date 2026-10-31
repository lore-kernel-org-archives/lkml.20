Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793473826;
	b=HFY1Qj8oOQblH5f9EibDzs38uH1YtZemvWyTQ76ck+0nZMHdFffxzaa9i06Qh5IPBZnT
	 m6WSgTbzefTQQUWPF+/vuW+OW0Mlf59dZTri+sGVbJdGNmGzP2u5wdyxMUi/nZ7kIgQZ1
	 YoRdNoTWREgU+c2i83kICnainSpWPfSGhheTEjIajC5OWQxGQpdnuahtHUL9SNiKj9D3p
	 W8qEQNadbxqXPN2RTYEsXP2Se35PrMbhNqJrMqApDxiaXJsxf4cq6YErITkjEPzkiVjqF
	 O0q2NY7hc+cHU5T/zfgZz2GEp3ilIcNbjZgLMVxtHW9R8YJ93umNAVj66XLWj7cm4Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793473826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=P15p9Hb5w1tBvsdlJFg638wJNRLHIyW6DyqlyUCSHFc=;
	b=Cg8FGas1Pc2/ZDHxywVczmOBH7iO9jrKsyVEMrPo8jozsG6XF5YE92g5Gnd/18evJw86
	 O7aJzRigVK19BRCMgB7wmMCRFKQGiR1SoSD0EnJ/k91YARrC+w8dBwqCC1iE1fnWTGvey
	 ZGCk5iGYAg+G6uuyVk6niT8C7cvkTn5121AtMjtjOGirgrQ+mTLu/ZyQG6Gno2HyurtTN
	 Tq+pwsUbdtjf9b8mRlNLdOrh/X9SW8ExQjlcwjl1pbL1IZkZkvZIXRDHAgjnpR1VYU0jt
	 FH1uL4YgF7EYzkAH6ZASIJSych0gMZgFhE1voU2e3GGv7TFQ7AyHNjUx6BzPd0q83xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=M0iRGKX4;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AF6606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3AF6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=M0iRGKX4
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-353804b591eso2919071eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793473825; x=1794078625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P15p9Hb5w1tBvsdlJFg638wJNRLHIyW6DyqlyUCSHFc=;
        b=M0iRGKX4ZakyHPXgwlWKQuWrbvUmrEt1k4+8j+Da6Dso/Dh7GSCRhGjVKtDYwfzJrj
         2HEAllh00C24MUCD82TGUaZz4bWnjiMTRhAzuWXvWqNUwh9NIMyFAIxSoJmQ4tgmhnAF
         F245HULIR/4UBpfnm4XNgJVWo0HiMpt1bXAuHbkJDG9vLis8pelTxr1WpUiwasUmrW+0
         9tOkzQntOI0UA8bT96YYn1nh7WxQBJCWb1rCljfbu4Ofk4oPQ7yUkax5ncCroyqti4PR
         O+aX72UPS59IWB8w+y+J4RXBJLyCiSRq72tVighCAw7INgBmnyi41FWHKGgDOpB397rH
         f/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793473825; x=1794078625;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P15p9Hb5w1tBvsdlJFg638wJNRLHIyW6DyqlyUCSHFc=;
        b=EqTfMkNr2VRy2WNRbpQ6s7SP+8FFABJfDO/3n8yjBnTP6BQx9KTsjEscsW9OcHAhgC
         HH6RwSoZ7LvlgMqSc6Ne8xhPqB4LPFdOhIJA+C5qC5N1u7wb2DT9By9N/llHXC2XHElv
         B92Cl3W3ROEzGrA53eTdhPKZG1Y50zbwfSZe58sAnJkfaGvDebIJti3w7LsmMNRCDhmb
         LzxldkrhyzxDg912/4jbYxLIKlPJK54i7hGhOxk8nUWOO3fzqJ3Jhl/CssZScg7RrEd7
         bO1MnHMngi136c3eSTa4aRk5OG2Kt0m7PjkL7n/tVLWjN4lfIAwKlmak5ShzJl6vUNJf
         gz+A==
X-Forwarded-Encrypted: i=1; AKwUvBzkiIb2NrjcjdvWHTB0PcLeUX7oui8MkzNiSjLhXcn4Tlx5Z6ULIm8+cq6ngXsiyXrTGYgp4oELTIgwHb4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaGuBY/X5XwGRu2l5hYAuHHW+VonvvvSQDeQ11n8a91UhdNXTD
	3A9dSpMfV4s0zItHHL4l9Sk6EK9ayzC3T69wCvT8mQzkTpJi5aRriYY97HBoQV9w0d4=
X-Gm-Gg: AYBFou0u2SLB0dmQgdvsDxFOSytG2Tgi9ZXS2jniHW/ZZoFeSgcZx2w48cIICv2ubyr
	kPWXNylA9Oq90EQB+76MhkFjmhDW9LNrsVqBaWrjT4MSdDtsyR4bT4oJqsCzjx3jGF6Q8kkqLcr
	XTYYewbWUy/Ew2H5U/RPRgD+JGlQqrWctPkzcM27ivMIVxAKbj6yToboITan0UoLd/5J1kyD2cK
	ji804BZlCFqHhn1kicqspq7EUUpJXe5adb/QTkCEry3u2mcfsuDIszKnFmZNnkXMHIiVcppdFxK
	O8+xIDgPAo3ehizouTK2K6D+2koUup75Q1C9fZ/CgXzppFwJFub676ulgWRmLtKATsigOrVSVc6
	gIUEKiMQF+3EGcMIP7mxtQy/amKxlQw4+T7uEtuqNwW6tn9G83Jt6pr0cL4XRAEVNKhVeTp1oSC
	0DqiG4NlV/jCEeYIypWQYh5l9lFJFpbeRt4Fhi0/qgNGbpmtwBJzOZFCocg5IfMJMcjIpKG+zN4
	z2z4Sz6oUSzPJI2KWQUaFQggDe6+52yPimDEoy/HmmrPTEguJD9rM/85ZQol+k9MAxWp7/G8i4A
	nPEmFV5e2Mg6fzGzj+5ygid8dvdBrp3ZI8DvwjgumMQrOKSe4SA=
X-Received: by 2002:a05:701b:4515:20b0:166:5552:780a with SMTP id a92af1059eb24-1ac5b028b11mr7948547c88.8.1793473824427;
        Sat, 31 Oct 2026 12:10:24 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm17384804c88.23.2026.10.31.12.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 12:10:23 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 12:10:22 -0700
Message-Id: <DMJ9ERWOMF5G.3KVDIP2QE3A7J@nexthop.ai>
Cc: "Richard Cheng" <icheng@nvidia.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Rob Herring" <robh@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Richard Fitzgerald" <rf@opensource.cirrus.com>, "David Rhodes"
 <david.rhodes@cirrus.com>, "Linus Walleij" <linusw@kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Daniel Scally"
 <djrscally@gmail.com>, "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Len Brown" <lenb@kernel.org>, "Davidlohr Bueso"
 <dave@stgolabs.net>, "Jonathan Cameron" <jic23@kernel.org>, "Dave Jiang"
 <dave.jiang@intel.com>, "Alison Schofield" <alison.schofield@intel.com>,
 "Vishal Verma" <vishal.l.verma@intel.com>, "Dan Williams"
 <djbw@kernel.org>, "Ira Weiny" <iweiny@kernel.org>, "Li Ming"
 <ming.li@zohomail.com>, "Lizhi Hou" <lizhi.hou@amd.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <patches@opensource.cirrus.com>, <linux-gpio@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <linux-cxl@vger.kernel.org>, "Allan Nielsen"
 <allan.nielsen@microchip.com>, "Horatiu Vultur"
 <horatiu.vultur@microchip.com>, "Daniel Machon"
 <daniel.machon@microchip.com>, "Steen Hegelund"
 <steen.hegelund@microchip.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v13 00/10] lan966x pci device: Add support for SFPs, PCI
 part
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Herve Codina" <herve.codina@bootlin.com>
In-Reply-To: <20261012142826.159178-1-herve.codina@bootlin.com>
References: <20261012142826.159178-1-herve.codina@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Herve,

On Mon, Oct 12, 2026 at 04:28:14PM +0200, Herve Codina wrote:
> Patches 8 and 9 fix fw_devlink issues specific to PCI and the
> device-tree nodes created during enumeration.

We hit exactly this on x86 switch platforms with
CONFIG_PCI_DYNAMIC_OF_NODES. A driver applies a device-tree overlay
onto each Xilinx FPGA PCI endpoint and populates I2C controllers
(xiic), watchdogs and GPIO blocks. Their interrupts go through small
chained irqchips that are themselves fed by the FPGA's MSI vectors.

Without this series, fw_devlink drops every supplier link under the
synthesized PCI root bridge node ("Not linking ... might never become
dev"), so the irqchips end up with no consumers. Unbinding one of them
frees IRQ descriptors that the I2C controllers and the watchdog still
hold. We get a remove_proc_entry "removing non-empty directory 'irq/N'"
WARNING per IRQ, and the I2C controllers are dead until reboot.

With the series applied on v7.3, the device links are created (up to
32 consumers per irqchip), and unbinding an irqchip now unbinds its
consumers first. I tested on two platforms, with 2 and 3 FPGAs (4 and
7 irqchips). Repeated unload/reload of the irqchip driver was clean
every time, and everything probed again afterwards.

Tested-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Thanks,
Abdurrahman
