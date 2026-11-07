Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794057861;
	b=n/POlHQF/Mz6kBNOV79ew4SlDeZT4JHu4wsqB0xAc9CZU0I5jNS7JQ3Y3WO5BsU+2AHX
	 52Ue+gp8sbP+mK29FJuH29s4o8+KIPFFa/Z/nK47oLNFCVwEZnnXsGPtEuhG56LNWFmqw
	 AfqJfSpTm02MWWbjJ7G4N4PxqSOVTul4QEKAyBqKr2GNkYKhhDUoXn1Hj89gYUQfecte1
	 ielwluq+Szy8RDxybLZ9q0CbkWEmAY+/nLxUDG36LhpG8HRCR1QsEYcwCa6ruMQMdH9C3
	 q9YsK3WDehCjzfVWSeoYkWnB6enMotFWIv5mx8RzcYcu0kNZ+9luMEyzXdjCJTVBegw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=z6cvIR8/w2KV+BnWSxqQJYCnMJX2uxJLLmGs+7Gm898=;
	b=j6ktLmVHJ0nNR5t3F3PyCAZ5gnISS+xSqn9qMi9CpKqJvNfwasIUZduQ/3uufV89TbzF
	 ZyM9tXGJ9QbGJGY1j5J/RwxG0Tu5Cf9YModVPMotUXD4+RJnBkw2XMmQkZg7ViGYXyjtM
	 IbIZ7AXW7Yf1egbkWGW8zydW1RS8wbx4i8kW9KO5G4ES27hslXv/18HYrX0h7YBbigFD1
	 /iw0rhf4elyxIA/fq9eTSxMzeWa+0ijS8aDydBUrXJAs3y0FY55q/ivNG3a4/+KO+MsCp
	 9+H9R41MxHMeIDwV6B8hlCE9yiDeckaoNlooOifB0CP0uYJ9yf+G1PBGKoDouudyyMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="egt/9Ydq";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A18F606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A18F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egt/9Ydq
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso574363b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:24:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794057860; cv=none;
        d=google.com; s=arc-20260327;
        b=UIlFz+1f+zLxj0S1OEUs36ivxLOCZgLH5quRBLMmmMpB+5fRDWEqMOK6BDv36cPQOI
         WwnzaLbIPhOzEdWs+piqXx2jej9QZIdGXBpGaZA7dJHEV8BmTaRl+OPiVtj+UATrk5dB
         ILhSL84A+9nI5Rf+uPT3UvfQROgoHXr5LhglDvfBG8T/LDNLMQjFIqM4hYZHVOGkFnxr
         vQGZk5oDCixedJja8ndVLUrbEvN0YiUxt9E+ymwWZK3lG/p9RXRVPGyezvWUZlceHyo0
         pptIypeg9Deqoi7Pb5hIFhC6uA5c7aqPKnIfFH/I1xTTq8dydvbbqZFc8YDRd+0FwAIi
         ZeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=z6cvIR8/w2KV+BnWSxqQJYCnMJX2uxJLLmGs+7Gm898=;
        fh=FFh7AJ0h8YoAjAPgcTmfkZgZmcQiRA2kMYauY/r7R9I=;
        b=A/8TXH10ykszaL1xkL0BYhCpcPLEzYkcYc8NjGFZ5MMqvrFlxs6t+IpA7iDoY0nli9
         RBbnSR8yqseSl3R4dfnuZAKbo9aDwVzroPVYXS4cQCDU+BLxKfsjO6A4R5m5Jtni/H1K
         zYumu1G5597ktpgYxEKwkLyqNK3lrU5I9s1AeyW3kbyYvC6/YDv0Oy1HBC6HXrbX0Ie8
         wb+ZZwv5kszXtSsb5otd6hTJvfPz7bbMAEAGssYsUPWrCk9T9OwYKR8pN1JX2HKAcnSj
         3Cr+oJ/PR6HhSkz9xFBsoZPjKeczomlIyvvPLuFadgp5ZwuqqxZJ3L8TMMRM58nbivon
         pB/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057860; x=1794662660; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z6cvIR8/w2KV+BnWSxqQJYCnMJX2uxJLLmGs+7Gm898=;
        b=egt/9YdquNPXu8FvBII2kA5NnP+1Is4C2I3wbE/15bbbcqw0QV21/Jb6Xy3qHTVI37
         WI09SrRKEfq8EZXttEBAFckJTz5wIQqdier6ICFf0EvMnOStSBZY9p4GD+iqWkSgYanl
         6h0SUEu7N3EyG2ow6t08i+BSWLy+6AGLAdOahKL9yTRg0YkK9xlItZlHLzeFTmwzhXjQ
         IKM3TWi1qBJUYMxJw0ltFs/q7av/xMOQ/mTK3ODWtpquJFFEt/knZ317IrLdu25zw3ZE
         zdhnH2CZdF9lHs8cSxR4n/TEm8cBtaJ8S0jNuTd8v17CmRfmFSn5WqWDCtZurN5ai13N
         cZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057860; x=1794662660;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z6cvIR8/w2KV+BnWSxqQJYCnMJX2uxJLLmGs+7Gm898=;
        b=DEEF+BE+MwOVwV+wYQzmN8q2mM3GwZpSvzuQggI8YVxxhhuMNuAYuar8VUkL7eQv7H
         gbQrC2aiOIcL5uOsKsqwEq45u4fPneNEekd4HUnOiiUouSaEnefH7xt/h5Xa6OGt2+B0
         o4+kjhdMtfnOo4Y+qcZO0dQoFF/4R2gy58JsdB4hilPOrMgUfKgiA76vB/jmZ9NUcbL9
         soNY+Ypm1r9Cede43NKTw+WqayvTD27hYh1fuP4OrPIi7q1NY47LepxT8XVzsrKgZn0U
         ok5cf2BM+7cLOqPVTddOMv8zZebxVUpyzUz8VEjIxVGrMe9QEBY8vOt21iZVPPHK+2Wg
         FLTA==
X-Forwarded-Encrypted: i=1; AL+hErHSeX9dpBDVDSUBziepNsc6TkYZKiAcI+ATJS63fiaUy+Oqs+F+1g5piPIXFbpaY/9UOV25xJuZwble1jQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cInNMtLMyV9o5u6ZZQXzX6Wh9lDa4xcUN1Qz2m8fl/npHiab1
	k30ep+jiE5+6ZmmvZ4N4gZVLkZfq+Nt+f6pKukKKS8lZ85RBELnSm2kTuRoaUTkeGupM9dX6jfO
	PckWiyaisZVKpOv3fjfAiYG9UkRD3ZoM=
X-Gm-Gg: AYBFou3fvMyczcoFEbbe78M0xndrY8SgrjhSFzog+JiVL0xVjsL0zmcyJ3QVgf8CCEZ
	BfPJC6ikrjp4BodT1vkDJBgEiv62pM1xZqjmbOnZwcf0MXSO2qECj2wcYZvEq+3nYi1Vorkx4ah
	hqNDDDMSwU/n4fE7qSYphNe5EsjAzM3EyKWrlr5q5kzi3gZY1YMlC7YA83L2WHbCpiUECUXHveg
	9gE8hC8A02dNIJJ3/aTgQ33j6cWtuf/WC4Cub9f3FteU9PIVnEbtWNZFh5SAlAZKWbBwzW3CAkf
	zpEsRO2Zv9LsFp2wvpdmYbHTD0l4BORo13Adnw7vlHVaNcNhvSjskMhJY47RCYx/LJOjnse8bqP
	cWebLUdiSEl1/pLRf5IMNxnSu0awCK7cNT53Bb271gUsw8lRzn3Kz9tgr4IvbVchNyYVi
X-Received: by 2002:a05:6a00:8c05:b0:89a:19ae:10e7 with SMTP id
 d2e1a72fcca58-8b37be50e42mr5386306b3a.42.1794057859877; Sat, 07 Nov 2026
 05:24:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Date: Sat, 7 Nov 2026 14:23:43 +0100
X-Gm-Features: AclHuK8W3wLee-SC_bINep9sAVMsLbYP6ki1_B-6wv6M2M-O8zCmkC4I3YCdlbc
Message-ID: <CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: Add Auto mode support
 with dynamic max_brightness
To: mpearson-lenovo@squebb.ca
Cc: Derek John Clark <derekjohn.clark@gmail.com>, hansg@kernel.org, hmh@hmh.eng.br, i@rong.moe, 
	ibm-acpi-devel@lists.sourceforge.net, ilpo.jarvinen@linux.intel.com, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	vishnuocv@gmail.com, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 23, 2026, at 6:19 PM, Mark Pearson wrote:
> Hi Hans - do you have an opinion on the path forwards?

Hi all,

a data point from a user, since this thread seems to have stalled.

On a ThinkPad X9-14 Gen 1 (21QA, BIOS 1.25) running 7.2.15, the
firmware already enters Auto mode on its own: Fn+Space cycles

  0 -> 3 (Auto) -> 1 -> 2 -> 0 -> ...

so with the current driver tpacpi::kbd_backlight reports brightness 3
while max_brightness is 2, and brightness_hw_changed emits 3 as well.

This is not only cosmetic. UPower 1.91.x treats 3 as out of range and
stops watching brightness_hw_changed altogether, so the desktop no
longer follows the hotkey at all after the first time Auto is reached:
https://gitlab.freedesktop.org/upower/upower/-/work_items/367

Whatever interface is chosen for exposing Auto mode (separate attribute
or hw-control trigger), would a minimal fix in the meantime be
acceptable? Following Hans' suggestion earlier in the thread, the driver
would report max_brightness (2) in brightness and brightness_hw_changed
while MLCG says Auto, and leave the ABI otherwise unchanged. That keeps
the 0-2 contract userspace relies on and is easy to backport to stable.

I am happy to write and test such a patch on this machine, or to test
a v2 of this series, whichever you prefer.

Thanks,
Andrea Rabbaglietti
