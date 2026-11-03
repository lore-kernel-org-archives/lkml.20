Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793716247;
	b=3e8ejcCndwFBCq5OEptNnIjLwaj+zuOWjJXq/mF/UX05RxWmjwvhByxIqLkxlkWuTvOd
	 iOPL7+YEbFlKr0Z6+q2OUwi1INgBIhTMpV+nN4RKtCRqd1ALgIvJQDNUMb9Z4A3TSjBlW
	 4T+vGIO4brl1XUkQsED6xI9IWxxdbynpOtdae6SELrlDGrtMyMQqjPvepi7eTSSZIdb3A
	 uZ7GNzr7urOb5S39guBfr/a6zwOLxrv4pMhwFRJAaM0hNP7xqEEm5ZWto25BVXLKlT0w2
	 X+sf1PnQZnQCVvV3YJ14VLZyUlFE2w6gJM9k4dy47rWgR2U/KpOgufgVdxRU5l14bkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/OyNH4m47qkiBrtBEXVKxPfbZI/Pm865e0NtmQba4xg=;
	b=rvG5swzhQ1rw0CrmIAApulx5jPazxCc2uBcuuzw0nQQJHN5twZ+Q/pMSSqaOPZwE5XI9
	 pgvtQ6VLE+E0RKgBE7Lx0LJCWCUojKhPpf1vP51V7/RHo3GJm4XOGn01hlSfJipm+9pr3
	 7T2tMyFGfHS4b2DiqK4oHngD2DfdHpDvOi66NWSZzvmVVAXO02rImGJRHIH6dOCOsTOD9
	 kAuCRitH6OcEVSPcCURlfUI0i1SKLHNoqcOXeEKHVFhwomEpC4RUc5wE53q2beRo6gqbj
	 UdDq29dPwaJUe/bHmRh8Xj8JZHabNmf1fV8YtTTtZXnLrE18FXZL5+SAgkEM4VRvGhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oBM1N4sa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2EC606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F2EC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oBM1N4sa
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a6b774d12so328160eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:30:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793716246; cv=none;
        d=google.com; s=arc-20260327;
        b=lpL3aMC8kKI74tB3jpYaAZz5DDmWDGp6atn+UeNHVlBOZkcsE+NjMRsO/w1QyW7U4G
         xWrFZNripT+K3iU6bJew0Mpquo1hTMat0iRDvndYNzB1XFYyx6TpQeBC1rVJXnQYfN7L
         FbDAKVfU/DtkKVcWGiOncWigLBT/NuqBBEStkgvGhMiH/Q2sU7uiFnrKDl2Emkf2PTd7
         YIajXGbHZSWQa2XqjVCzQAvF5h3TtZOHl9RA7LA0cRP5OUNtwa1fFloCghvCnief70oj
         oI1NCyPZAYF6BLQ4uoWuYy++OkbCvn46fx9+TrLJhGI9ClrsphYcg7KH/9VE24GF4yMI
         sXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/OyNH4m47qkiBrtBEXVKxPfbZI/Pm865e0NtmQba4xg=;
        fh=RQ56vti5W9ag8wO3sfihzBYIfm6fTiKWeX6XYtyU5c8=;
        b=J3tGz/gMVdIxOQuEtccndsfzCrItfUoh8Q0z0f7IuQdvXx+0H0M3TGKUHklpNsIb5J
         3g8xV5x/23/N5eQ60br5vanVujWDmkCeJjWboDZZFgw+9t/9BSc9uJgQTlVou9CD8/8O
         5vM6JSwN1nQUKNz9dEuoIOw9c9Xg1h93C/eArnvhnujmemo2+SY4u3A8SACmDlrttmV+
         XPd1DNJj7sybQMWf6Usg7AJcaZF8bJLK/r3yAtTM+NigaLaLvcajbwvS4m+9La+Fc7aT
         n0TAIBJm7XymZ1jQ4ul54jCsadhDd3Ul/wQ1OibFYjz4XhzbE3wYBERivgP/eAPEexET
         FMFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716246; x=1794321046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/OyNH4m47qkiBrtBEXVKxPfbZI/Pm865e0NtmQba4xg=;
        b=oBM1N4sa6U3jNfhhL7I7ObmRfkyN+jR4kbsvMKPQNwyrfNXfF39v2l578aYkXxGksL
         5G+GQQ8LJWM3cSE3emoIAWFi/W67piDHUcr1/1cN7wkm2zMdjyBJVfuxWgF/HXolIwqZ
         aupLiA93MIrY/vVelLLtT2QlzmTejm2qQP/wRnmIGrLuqQMd57L7rrY9IhyPsI45UjWZ
         N/m+jyBgJydQhqbfqg6QwJyKI9diPjSMpXLLzyYPcQ7yp/KFtGOnwFFXlBN8v35dlfGM
         AIZcy8OPD0zxFjxyu+A9IboneNaPg9cU7NapUUKyIa+2syMwuiL3vZ4u+FFBXm0vZ00A
         APFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716246; x=1794321046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/OyNH4m47qkiBrtBEXVKxPfbZI/Pm865e0NtmQba4xg=;
        b=R9xy05nBKL6Wkp3sewZuhybSRZc5LTvEL+NrsnXlBFBqMKjIAjSw9xny4fNAtJvQhp
         G219t+dwK3XAuvtJ3CLRYNk3qzL8Csl6QEBp2rTBGoVzHAVzt5r6yeiBKESLENaLH7x1
         eQh1Pc55QZiqdUMbJPDQhuYMiHh+uhAcxLDRy+qf6q56fVryCrbxP+qBGj12ekIBbml0
         pfuwqjz/QImXGwnGASvvt/Ecu5PIohpFg61x2JgswDYTh5H9DPY+yaelUakNuQn6powS
         s7YP5KJeCISSnboMZw9IWgSbfiYMtMBRE6bJJX2kS++0raekvzCJOL1AJkYYksZADfgF
         aFLg==
X-Forwarded-Encrypted: i=1; AKwUvBwhdXuebeaPhPgJp75K/C0aOHOWKzLme9Xwc+3PlH0uk9Jw1Chh18/aBLch/BGqH4lPhU6CNaATJMyPCoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gJvoouVPl2wQ0GcWfNmp42o3ub+RNA/AyZXjnAxRuqyl8neOr
	MqraPFArZDmr9OuGPdUaFYl3etWjqklvaxfQjWViVg+N+n8N7N4cbxoVg8f4SSe9PA0W0LYhOSa
	Vw7whyPV6RgG/zXY+BgImMOYgpAaesxU=
X-Gm-Gg: AYBFou0XcL6IWKMlKjI/PbPhUPiFswzvExbgyOs5bSYXgb8VhDmX3WoFME2XJhhnA1C
	w+NE+56PySDEzQnkstonJ6KVmH5Vv/jc1nZeyh9FxyN0/ZtHzUrptsF8qkc6+0B4YXNacI2K+SF
	j4p7EL9Gkz8shn9WXoKOG001LFIxReBLBZ/KrPUm/8Fr1+tGdpu2h8ZrGd4vI5j2yppLdJiK3Au
	TJzwwpaLUDAoT2cavsC53l4yrKX2QPDMoskcKaJWFrqXUigFliX+G4pdTBALoaIVEsk+iyXmolM
	cZm6CGbSOZMeBX0HiGhtL9ptRiHTFBhhZHGorOi7jYuqx7XIaf+FlRdS+pXa+/KLeefg2MJYUDk
	wsqaE6T5XDaRti1JlhDJ8XSQTBtaMLG123azAUB8USXxiPSODL8a0j2pRcpNRGKjTFAvT3f9uvs
	yxYypcT5YITHov4azKbPWBLpo=
X-Received: by 2002:a05:7022:eb46:10b0:14b:edb2:c3bc with SMTP id
 a92af1059eb24-1ac4fd01362mr31568742c88.0.1793716245958; Tue, 03 Nov 2026
 06:30:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260916144014.879355-1-ed@aicharmers.com> <CADnq5_MsaUDm8rcxr3_0wuEAXywxziAofOO9w-dUxYS9PUoasw@mail.gmail.com>
 <20261030123000.5573e70f@kait2en-mbp15-1>
In-Reply-To: <20261030123000.5573e70f@kait2en-mbp15-1>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 3 Nov 2026 09:30:34 -0500
X-Gm-Features: AclHuK_LxctmigwVoDcx69kjcX_YjAvRxU28VYR1bNj9rG5Y2V1BrN_dTiv7lGw
Message-ID: <CADnq5_NCB6ur05ZvP0fe9hsgLHM0=y_Wx31G4vkpKH+F7yZ74g@mail.gmail.com>
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi GPUs
To: =?UTF-8?Q?Andr=C3=A9_Eikmeyer?= <dev@deq.rocks>
Cc: Ed Schofield <ed@aicharmers.com>, amd-gfx@lists.freedesktop.org, 
	Kenneth Feng <kenneth.feng@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 7:30=E2=80=AFAM Andr=C3=A9 Eikmeyer <dev@deq.rocks>=
 wrote:
>
> On Thu, 29 Oct 2026 17:57:49 -0400
> Alex Deucher <alexdeucher@gmail.com> wrote:
>
> > @Andre Eikmeyer I think this patch should fix your system as well.
>
> Hi Alex,
>
> I guess you have seen it already but the patch doesn't match the 16,1.
> Its boards are 7340/020f and 7340/0210, and v4 only matches 0218, 0219
> and 021a.
>
> That hang is what I sent a fix for
> https://lore.kernel.org/all/20261024162109.307247-1-dev@deq.rocks/
>
> The VBIOS trains the UMC p-states at different frequencies the pp-table
> lists. The SMU hangs as soon as UCLK switches into level 2. Deferring
> the UCLK enable doesn't change the levels, so the hang just moves from
> boot to later under load.
>

It is the same issue.  I don't want two fixes for the same issue. I
just sent an updated version of this patch expanded to cover more
macs.

Alex

> The two patches can coexist after a trivial rebase.
>
> > ...your system...
>
> I need to clarify here. I actually don't own a 16,1. But I maintain a
> distro (KaiT2en) that specializes on T2 Macs. So the patches I develop
> are extensively tested by the community before submitting. Atharwa is
> part of this community. Ed is not, but Atharwa reviewed and tested the
> code.
>
> Best,
> Andre
