Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=88.99.38.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615057;
	b=0bwckf6E2w6/Y/funqH32oEePeXLIMdAOtqLM/S7fxU/AyZS+aQBt7Gvz5go3COJZB06
	 ZgPQTTQw3QRJgjg5/mC8HyjmIxGdWvhs9uh9ccOOu0cxzSW452M7SzWU+f6xkJkWDZiPw
	 FJ7FsHlSPbNovx8Jj2ahwI6h6tWN1Ev22dL4o7r3bNkDCY9ea5FKd1AUn7CSOOz9HNVEE
	 f98zzuHaraMYJQiUxMXel46KVyKmoNMHPndvO/lVpwryhL++eSH+NiTzkxL28kDRXvAJ1
	 G0y5PTMgaO6AS6XilzflKE5PxwLIGphoX4oOzCMmnsHXE/VOH6RE57O1OOhPQgC4pQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615057;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=ti1/rRcvOD2x5O5nJzi35aJUHDueD5KyDlDPz3RWxwA=;
	b=topuwfL6ZXTDpcHqKWWk5H1AFhpym0y+CVL3D5MqiystWjZhFBlwIWL+w0kARY+6c9Sk
	 Rq/sSBpXQM5KxruBN7j+HQTs+oT7U4i90HTrFFJRr0PpLX2tCrhHk7CcKeov06BVL6fHk
	 4Tb9oM7HmPgI++HltG1gFNHk2tetQy6dTaG7cbrjRb/7KkXTSqOvNWskc2e9G/u+iGug5
	 VHVbYgFB65dNx3In5Nwdq5Q+jm0NeM6HInQWFJZS8PlSdNcQ0Ea/WcKuFYAbqSTjnzfud
	 g4iLRXtbiINhKh1SSW0Q6L7GQVA9ZlosDNRItfLV4HHCCW2ySm+R1a9qHBroN8u16Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=aSGfXsjM;
	arc=none smtp.remote-ip=88.99.38.195
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88050606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88050606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=aSGfXsjM
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id F3744BE32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:24:07 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 41F2CBE388
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:24:07 +0200 (EET)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 74B71200CAA
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:24:06 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793615046;
	bh=ti1/rRcvOD2x5O5nJzi35aJUHDueD5KyDlDPz3RWxwA=;
	h=Received:From:Subject:To;
	b=aSGfXsjMeXDNmvzpZEuClQ8GRMIIzklHl3v5Vh7RpOndd+ac8mMVmwL0SEC26y3z2
	 BpHwepEabxTbk1BJ48YUcYBP1PwCzUZ4ZQJKpGBxbsbBr/AoNjZofiRSAuPe8wHif/
	 FEVxBNwHT9vKQNayGZ5gwQoE+f6bhI3o7GgCTbV44rTzqr6gQ59UJycXv6Qqu9VzzL
	 EI45Ims+cGv7VSC01ou/Jspe96+76l0PTWQC9+EmKc9h4iTHJZOSmYUC6bxphYIkcg
	 O5adEzQK/ZzN9lmfzdS4R1hFH7BSImCbgDeawjFu3n5KJH2F/ZCbiCbjT65oa4Jvd5
	 tjvi31mIxR+jg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f180.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2eb18f4da15so8770465ad.1
        for <linux-kernel@vger.kernel.org>;
 Mon, 02 Nov 2026 02:24:06 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AKwUvBxAZcTx5A3e+bseW+c6AokZSwElDnBTdFcsaIFRuzyMVKmFUQDruoVYX7VwYe9CL9zhsLcWQmA2aIIozcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b7Enk4DLadl5yKc+Q3nrTaq4WiiwKY8e3OfYHNU5rk9OsmnVw
	2Z/c4fDizdi0VP3721t133PdnsjwEMsogj7gHcUDuSbW3Lhdrfb23tFj+tHncALCPY8xAFhHbMV
	uCD/EUk6JIVaxj9D+44Qhn6XzMa+EUlc=
X-Received: by 2002:a17:902:e745:b0:2e9:5eee:e074 with SMTP id
 d9443c01a7336-2eb364ddce7mr84007385ad.46.1793615045027; Mon, 02 Nov 2026
 02:24:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <P3C8cUq--F-9@tutamail.com> <P3CEBDi--F-9@tutamail.com>
 <CAGwozwGQvRbwg82M4Myv4GQJhCPEhjyN__6DJ8UdMb8o0V_Zcg@mail.gmail.com>
 <179357183245.7.3137161079355845805.1738723974@8alias.com>
In-Reply-To: <179357183245.7.3137161079355845805.1738723974@8alias.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 2 Nov 2026 11:23:51 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHn7QC=K_ui8YxxP1Jf7Bdn_EFkFu+x+L25P2Vs5yRiJw@mail.gmail.com>
X-Gm-Features: AclHuK8iC5QkjYV9fntN7Y8hQOvyIPvVGu9CqIOdVveRIgWMeqUYF-A6BETLyYg
Message-ID: 
 <CAGwozwHn7QC=K_ui8YxxP1Jf7Bdn_EFkFu+x+L25P2Vs5yRiJw@mail.gmail.com>
Subject: Re: [RESEND] ALSA: hda/tas2781: TP3407SA evidence for the January
 custom calibration address patch
To: linux-kernel.supreme403@8alias.com
Cc: tiwai@suse.com, "Ding, Shenghao" <shenghao-ding@ti.com>, perex@perex.cz,
 baojun.xu@ti.com,
	kevin-lu@ti.com, sen@ti.com, matthew.schwartz@linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179361504675.2151083.3176888208724695871@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 1 Nov 2026 at 23:23, <linux-kernel.supreme403@8alias.com> wrote:
>
>
> Hi Antheas,
>
>
> Any news on resending this patch? Is there anything you need from me before it can move forward?
>

Hi,
thanks for reminding me

I will send later today

Antheas

