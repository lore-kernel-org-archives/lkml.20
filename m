Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C5549CF3A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416310; cv=none; b=svwDLNxr48J16PcGuMrlVzHOJzU4AozUaznpFe/l3cJ5Dw3yMKCELE1jrh40aAQG9qdDueFLano7g9Ua+aPOJ048mCx6opBJ72gPZhYVvCI7c96xL+c1LiQ6/BN0B7OVGCqb5EckeDEiEzvZabDOJESRnzK5pu0GScdj7ed6okw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416310; c=relaxed/simple;
	bh=AzKSoRwvTjlokWKwNtPUDkmp7fh7XU/ixZUbBOqey1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sww9erkCxzaiqGjkRbYbZGlPJaL/1JIdBfgbAgULcKaVRPoI3YbtHjJpBUWOp+KYWLRca8CqxD+tx/0XE8P8y1ekqBU6frJ2m8hcg48enPGCpZ1qzT043Jtxm2Zr+0I4z91P9+w9Lcz2AJPvIifk8Ks4ogr1Sjm7LMbIxkgzP0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=W+UONO1O; arc=none smtp.client-ip=209.85.222.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="W+UONO1O"
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-939fa4f2b81so211509885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416308; x=1790021108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OIidc7nfo4IBJ7tzqZdeeXEx50mWtljjao4fEGgMHU8=;
        b=ncAULlJSD7GRR4qkCpMG8yztw0ItMmlE2/qkRP0ioVPpB4ioE2RsuStDgx+kB2GtQJ
         xBxdI+zBkqH0U0b4WBfOo8W8FbUsEiR6DHGr9sAZkCdTP00uheZ7STgzWZufk595QSMP
         TKRiyW2iw3GizickQotAKN63tv3QF2xRabhr4ORdtWrpzZvl2XpIF+8GIyniqzsq9lXg
         TBIMAArh6PP/WXm2DvdkRb2OeCRPjtvowJz3Owu/6cKuDb4GornFSbWmkshMWWwRupkr
         bh8HCOYNam/0FnAFsVVmerS0+FseUJYplQVIB0EP46OpYq/iYgWwLKKFdnQ2u9z/eq3S
         WROQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCVvT+6k+jXi9nUIgyMMIr8mU3kATXB7iNeRIv+Ac/+hM+JEZx4SBeOuTH0mN6Z+LGG/nxduHFacelphs=@vger.kernel.org
X-Gm-Message-State: AFuF++m+MViiS3D+OkenCU7WqLiPgZ6h0C31XUIgj7nhnJ+dkLwsEYMe
	Xf5d/Lu7btuOtvBhAiCp9xIC/uNcW9ABNBRI7D+sTlur9ojiE7NNFdGuo10oh5TAHI+Xw9rrqgQ
	/lcD5GgyojYiK7RXhLEZcA14I9JnKcZk5xz25rIyThd8wOnYKnYG9K3M6k5iRmc9DX4eD/fzYbL
	gj27v7uEVjovdwAjiOskX0vSyH50wXZpO/lbz5Ex4DeYOmCIohGIn8TBph8ZH9DznyUgN9HvDNy
	SQ+pcuWh2Ek+KVORuHXq0S4Qw==
X-Gm-Gg: AYBFou2lnkWNMoJHbMEeG3XC+omPRNZnXIOUAQHv5h7vWPHAlDB9Nte2YBaDGYnnFu1
	2WgvgKiDUStyBg6bXNc+WjiV+qoj8kAPfwaXiwATBsHB9d4HUJ49tmpImfUEmNnDKy9K6/5xUsY
	fqx6LnokZc8CTkNBb6RDlaA4iSjuhHSD81Za1YVWd9eeq+EjESh2VjKT26OAKpIAxWrl5ORDiRa
	Go7BRegL2aPFkUcteZCTYVsv5eDOYbXPsDSXtr1puu4HVOoGsSzoxMr24MQJ1g+3q7QaDI4s33z
	NYPBKSBlC0hyqH2sFk4yYRsSODnWHX+fz5HZTJwFBJXV/cZatAYGS5btChnCig3pUgg63jqhP8T
	hsEQxktxGNoyCtK8lPnpWVJOMg63Lz/Me+aEIn+RAaFiqVzf/ljJtGS1LBvEFxDk=
X-Received: by 2002:a05:620a:2590:b0:939:5ab4:e6ab with SMTP id af79cd13be357-93a296fe0admr620031985a.5.1789416307869;
        Mon, 14 Sep 2026 13:05:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93a101ff397sm66903685a.8.2026.09.14.13.05.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:05:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e80ce3597so86582116d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416306; x=1790021106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIidc7nfo4IBJ7tzqZdeeXEx50mWtljjao4fEGgMHU8=;
        b=W+UONO1ORBoFXDkLQnuKDTxqTbRrwvs/wkeNmgYOHdUMx0L7GXFBEZndPXsCmMZL+a
         zcCByEUUcsW+qjgdrbnoz54fadGlE9hQ8cJ+k9WN3OGy85JLGAttUlHFammZ51pbtTo1
         lcZoD3Msp9JeFveRGAW2Xixhr3o31OEISSHcY=
X-Forwarded-Encrypted: i=1; AKwUvBxm/YDf1Qvataqpf47U30Da1OX22CZJJmoD6nz/qngBmBrTRkc10Vuee6oDf6+fqWkr5JuAAziSIZZp2Dw=@vger.kernel.org
X-Received: by 2002:a05:6214:5003:b0:90c:e613:4e33 with SMTP id 6a1803df08f44-9122e52e2a2mr65468066d6.23.1789416306071;
        Mon, 14 Sep 2026 13:05:06 -0700 (PDT)
X-Received: by 2002:a05:6214:5003:b0:90c:e613:4e33 with SMTP id 6a1803df08f44-9122e52e2a2mr65467406d6.23.1789416305608;
        Mon, 14 Sep 2026 13:05:05 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a6ebsm103081106d6.22.2026.09.14.13.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:05:05 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Ryohei Hashimoto <laurel.medalist12@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v3] wifi: brcmfmac: log the firmware status when a connect fails
Date: Mon, 14 Sep 2026 22:05:02 +0200
Message-ID: <20260914200502.1747715-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260913165526.4426-1-laurel.medalist12@gmail.com>
References: <20260913165526.4426-1-laurel.medalist12@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Mon, 14 Sep 2026 01:55:26 +0900, Ryohei Hashimoto wrote:
> brcmf_bss_connect_done() receives the firmware event in @e but discards it
> on the failure path.  Every failed connect is reported to cfg80211 as
> WLAN_STATUS_AUTH_TIMEOUT (16), whatever the firmware actually said, so
> userspace only ever sees:
> 
>   wlan0: CTRL-EVENT-ASSOC-REJECT bssid=00:00:00:00:00:00 status_code=16

[...]
 
> The status reported to cfg80211 is left alone; changing it would alter what
> userspace sees.
> 
> [1] https://github.com/RPi-Distro/firmware-nonfree/issues/38
> [2] https://github.com/raspberrypi/firmware/issues/1829
> 
> Assisted-by: Claude:claude-opus-5

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Ryohei Hashimoto <laurel.medalist12@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 ++
>  1 file changed, 2 insertions(+)
