Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793411340;
	b=v733Tr5vUP5sz7LArrliSECMXZOyi0HeXATCGizpMRXQyCRCIR1o2AjmuusKiaDsbqSD
	 akHy7BRQdFb7hdmKC2JgLfVkoJZvS6DQOzfeVXREq8IHkPpI+YJVL70ykuFUOMpd0QgiJ
	 31HFjYTp1FLRSxPXQEvsMfXWglkhDL9dqW9duyFygz2qc6s6DFR0wRd7Q+NLV618btVue
	 QkVnakJ29K53L07GIA5bZ6/zaa7vTAxJQJ4rQZOWzpw/3GIWegteb2X4wiBTmwFJaFzGe
	 UrBOp/l0ZECvj1LE4OktpgpFcfP4AK1DusVCYYk1lphR1EU8afnJaFIphqTJb8zElAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793411340;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-DetectorID-Processed;
	bh=1SgcnqVdQJGi68NMbZM9x7rfQgXngTJp0Jblk14QXao=;
	b=T0pCpiAOenfbT7Bo07oqL/YiDixDiu4FPp+xjx+0HKW7cvth3drmpog1AOYS1u1wR5Cp
	 ZwM3cyILbcPHIFu0aNUJc4meBRfMbzVNIzXwlu1hxbhAk2EKDKrdnxP+n+9+15Qq/yJ7V
	 pXGO8B+G3fH4e4OZYXCfxrhOQl3Sw7eujN8EdcXsV1JIJgoXnfq6iPHbMg1XPzt7e+2u8
	 1RSV7lOw+3ItXgCG20vnwmHf4E4bjghtvW77ebgpojR44FVljHnYJJY4LzfPNb+OBcJwI
	 ckVfOdAjdlZFwHgNTOec475xAasfm99Y/2wqGDSUjD4oNY6/4OEG2C7ZzLyNp06YwBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=feoWLFWv;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A526606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A526606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=feoWLFWv
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so687803a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793411339; x=1794016139;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1SgcnqVdQJGi68NMbZM9x7rfQgXngTJp0Jblk14QXao=;
        b=izOF4j1dzV/FLnENQKLea7ogvF642tMy2lYb3eNK+YLJpn0okBhqq0+gbD35w6r643
         +8KZHGZGUnK/hcTIpVsUV1LYaSEK04AIB0mlOUcYTgoanE9mYnN6YkI62f/o5n92x2O+
         SBKpwSexrgStjW9KfiG9pkOrhSVSnPVys5n2oH3HedX3TBJOwvpy5ZgEz6k4TD4+pOoU
         oY33jINpv+Q5tmShD3DWx5MbvBnlMflnqrbBXZGJWvR41DZIE1F9he2jkCq+SeCUBZiJ
         SQFPosAdAvxHH1WP6LglKNc0+gsjU/uXAxKuVFuIGmKYQ8ar6wEGVSUhbg7UrYluAl1k
         YV5Q==
X-Gm-Message-State: AFq9FYK4Cgi8uYUm3uiJmM8mLOHLfFHmzPqqcd6RjnhtVN/UI1FfZ/ac
	xWuwBjnRiM1zAVpy67ObbXgPGTtxIkNSwd4J9PLfCFc++NAvYtHh4fzVuEVBiQ+sh5bHJz60w0p
	Td3z+ZzxjGg6N1VzFtBV+LwaQzatt476a9CuBNf5cLzmQEw0hpy0xroZrbV/46ENn+kp1iPdZON
	1SGlvwb5vCKzrLU1yMPoH1cgtCsl0TTN5cYk5dubvNTw0w5aO30Ggf8NFOcU8zTQ7YkGGuNBP/F
	NM2F5bn5trGbwbPZQBSF6HT
X-Gm-Gg: AYBFou2EPwtm/FpNvo2uuxx9PA0KIiPtfnabAfCjEWXD4MHuCFeLcQVNlMOFL6VAiyG
	50MKWmA5TppErRtODTqSUFZ599fey96gUxwXNc5MYCmTY2tZdbljAsrmdlf1ncuLjzPb/ADmsKn
	aGBOLVHZKuhh5vy9SUmnjYjKi1vs39mWo24AtecTUhmxFa54d+xLCJr67d8YXVIM/bf6U36N1WG
	rPb8tCC86Yg+/O3UAja+LUPnbq0qYpN4rex1KbzYKbWTul4OZEDtkVHwjSNGsnj3AJutUPQf3Ow
	6+Th5iDnuSSd77hYjTHHNd+rINmnXKSp8M+vphKUbuyyu1SYEYHeMnij5+u0+axKCMC6oSoCWN5
	j8EWyR6QaZGZ6XZcSKsUHsw3tjnY7Z2Rt5QLfSPTiNjrdlIT9xCBDX1rqWwEYP+xItG/vJDR6b7
	zl74AFZllhtwOEeLexgwYfmK9pedPyNLHeImrSF84q
X-Received: by 2002:a17:90b:1b03:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3ae89287394mr3014608a91.0.1793411339472;
        Fri, 30 Oct 2026 18:48:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae881b1b69sm882955a91.4.2026.10.30.18.48.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 18:48:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso1555519eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793411337; x=1794016137; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1SgcnqVdQJGi68NMbZM9x7rfQgXngTJp0Jblk14QXao=;
        b=feoWLFWvg9VElaO694lDcx5hAgfvD6f/6r/syVkYhCtogBpSTkDjMV8Q5KWqEc6PAQ
         HBhCOQSCEuHdg4GoDrBtTYSofEA2tZSBZ4VXXBul6Spn3q7Ia0NNDfC3YEmTzK7u7tmL
         TVyZjpcw6TeGhtDXKW/XuBRnrUYgKYRxb3to4=
X-Received: by 2002:a05:701b:4505:20b0:154:fa0b:6df1 with SMTP id a92af1059eb24-1ac5d69f9c1mr4947233c88.37.1793411337502;
        Fri, 30 Oct 2026 18:48:57 -0700 (PDT)
X-Received: by 2002:a05:701b:4505:20b0:154:fa0b:6df1 with SMTP id a92af1059eb24-1ac5d69f9c1mr4947199c88.37.1793411336852;
        Fri, 30 Oct 2026 18:48:56 -0700 (PDT)
Received: from localhost ([192.19.50.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm10290353c88.19.2026.10.30.18.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 18:48:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 18:50:17 -0700
Message-Id: <DMINAFH3EEBW.26VZ1LKJN1CSI@broadcom.com>
Cc: <linux-kernel@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
 <mripard@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>
Subject: Re: [PATCH] drm/vmwgfx: Fix use-after-free race in
 vmw_dumb_create()
From: "Maaz Mombasawala <maaz.mombasawala@broadcom.com>"
 <maaz.mombasawala@broadcom.com>
To: "Nair, Jayapal Ashwin" <jayapalashwin.nair@amd.com>,
 <dri-devel@lists.freedesktop.org>, <zack.rusin@broadcom.com>
X-Mailer: aerc 0.17.0
References: <48e6780670395107cc9853bf63fa7ac1d034cdd7.1793249917.git.jayapalashwin.nair@amd.com> <DMHS7SIDIUGJ.168385UCMC4QI@broadcom.com> <7a822adb-ddb5-4338-8949-3ccb0942e0a0@amd.com>
In-Reply-To: <7a822adb-ddb5-4338-8949-3ccb0942e0a0@amd.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

LGTM!
That sounds like a good test case to put in igt, please do so if you can.

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

--=20
Maaz Mombasawala <maaz.mombasawala@broadcom.com>=20

