Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31BA4EE877
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787911; cv=none; b=cI6mWF+o+m/q/Ueb6LC9QbmIXL5e59lvRhXy1HKmhW+HSxhgW5Gdzz465+mYSclIPZ1M6HIrpO3REysrMszLESSMtIWKBy4Nd1Zk25FfEVue7AkQSg7shIcT4h2mzC5gSabNmbvbFUBb+qxZUQlQr4HNmZufSqdcmwDVAxRmXmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787911; c=relaxed/simple;
	bh=vSD2AYUqreAplwWCoXjMl8VsUBh+Ur5feTbvL7P08Rk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=INdl4jNg50qBy0HbUos0dfGoOeCalJAfIXObphqDXKJ4I51m8FkpheW9Wt/SR4JFvZ/83FpepI9KVIiWHvCtD2jVB6YxV3p682D382SWvu6+gUVUpxS7lpA5i1hWYbbdY/ifIXyZujj1it39ctywLEISb78ekyOusXxEpALwvdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=KQxmBaSu; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="KQxmBaSu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1788787909;
 bh=VxFACcZSg9jdFJMF6rmUZ+dSf6/n4Bae3xVZCZ/pLgY=;
 b=KQxmBaSut3APOHniqWhuMNcJZ9NNk6yRteGP/uxGD1u5vhM8aWJY3uTqHvkm78ak31cnwMAms
 ZCUiDWeQh9slZjzXgsqLIM2A1M0wCeKtAXaQG77tNjVKuIleBhenluwlxqWrVcM1jOb4h/34Aan
 89uJ6LV6V6c027i8UpGLzsg2kybyioTRObvyEHuLO5xqhsggQrPKjdKuiOXodI472DADRUkl1Pg
 x3zjXRrNAitJd30UhmTZz+cEVY9F7g3mU3L+1fUW84YisN1D6YrvjwlQp5PEp6roatwJHsZ2fAM
 Ytl10C3Ng0+pHne5hiLqtLOFGjr2+LJ7mMsa8SDILJww==
X-Forward-Email-ID: 6a9ebcb816171017b32bae93
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 07 Sep 2026 09:31:34 -0400
Message-Id: <DL94DYGNRZC8.18LI4590FX0S3@ubuntu.com>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 02/22] usb: typec: Represent USB4 on the Type-C bus
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Andreas
 Noever" <andreas.noever@gmail.com>, "Mika Westerberg" <westeri@kernel.org>,
 "Yehezkel Bernat" <YehezkelShB@gmail.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>
X-Mailer: aerc 0.21.0
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-2-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-2-1f80085f93fb@kernel.org>

On Sun Sep 6, 2026 at 2:36 PM EDT, Sven Peter wrote:
> USB4 technically isn't alternate mode and entered using the EUDO and has
> no SVID or Discover Modes Response. We can still represent it like an
> altmode on the Type-C bus though by adding a mode kind. Exclude the USB4
> modes from any SVID-specific operations and driver binding, but allow
> consumers to observe their state through notifications.
>
> Like for other altmodes, expose the USB4 mode to sysfs: Add a mode_kind
> to be able to differentiate and then expose the EUDO, make the USB4
> active state read-only since we only represent firmware-negotiated USB4
> modes and omit anything that only applies to SVID-specific altmodes.
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Hope it's fine to add you as the contact for the sysfs documentation,
> happy to add myself otherwise though.
> ---
>  Documentation/ABI/testing/sysfs-bus-typec | 36 ++++++++++++++
>  drivers/usb/typec/bus.c                   | 67 ++++++++++++++++++++-----
>  drivers/usb/typec/class.c                 | 83 +++++++++++++++++++++++++=
++----
>  drivers/usb/typec/mode_selection.c        |  6 ++-
>  include/linux/usb/typec.h                 | 20 +++++++-
>  include/linux/usb/typec_altmode.h         | 10 +++-
>  6 files changed, 193 insertions(+), 29 deletions(-)
>

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
