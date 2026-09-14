Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F08A351C13
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411390; cv=none; b=A2KbDhCzMTl2jXCnHX2jC8oDtUhnLSI4q6rE93QD1x2LTua4Rkq5o0N7/DTY2CbBzBj4p3GikYpnoIkpIFc/RzvGakIhH24nHI8QFFplUlNF46OHeS0a3HQAF0MFwuuYZB6d3bZEXP1Bo5mG62hikP+TFofeEKa/3fV49KZ84zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411390; c=relaxed/simple;
	bh=VLY1Umk1yU84Icqq1PhsKQcaMi/Ow7hXTIZ5IR8tK0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OY80+C3v1a/pM8nBoZryHl8H94o0lmEF/lnZFvWE7ozsdY0qo1urTXG8d5M+yyBoqAlSHTpwjRE9y8tzQIBN9CPSUVFFkjdhGiFPWmiBBxioSWGHNkDL6QmOV7GM6NxCmL2AOy/8aZXUKuiRGlwpmc/A9QmwNNBDAV5Gvt0Vha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OvDfRVAN; arc=none smtp.client-ip=209.85.128.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OvDfRVAN"
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-861a2ae9c51so33374837b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411387; x=1790016187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZHVxUjP7ai7HQXDh9w3LrC0rVTP6eIyhyn5Gf7ApeE=;
        b=qyu5BRewqfsFveADJMgohy3DEdBzpJeJm9cgaN6hSQMB38nZA+fAs303xqFOf8oedZ
         ZkyWnWpXufQJhdf4Blcto+pKZqd6e8JcqEn1IrKoFBq1aEZqWxgxVP/R/N89Gjk8M27c
         wtwv48PxjY9MECN59eqec450Nf46PtdK6LKwRVEUdZylT8D5utykCtGBPMlv22gYRJwM
         WkwqTPaEpjVhteQKZmGNzKmFMFml7WYCEHqQd4sHDTYRW6wp+RHowUsgCkVmsi46CELJ
         NVYACbS2vb/negZ3Gdv6LekujY9h78bwRf64VMfk6/bIDHtQvIpff+lewwt6gl7SLxXh
         H0Ng==
X-Forwarded-Encrypted: i=1; AKwUvByNzRcaFxTWGd+nzK1Y4rGqpF3DnNl/LfQGs2JbwZuhoqHdDMFP6DBZccZnxC4d7kV0iIs9IMpwC3EwaL0=@vger.kernel.org
X-Gm-Message-State: AFuF++kwSyk6DMZkUWMB9gsjnHEnnn4R8SiSxnm/WRueR5c58T0M1HYi
	Ah6m7Rv1BMWArZYwRishGfCJrJbWYQu8zmfpy8o0xyvvTjDC8bF2aL6wDhYnF3DOZzx9lptJ3CH
	IoGDedyVKXBHHPXQaDVFoCF9JmUtWOH5Czfdf+9k9sFHNDF7To/7IO5tckOmsB9HJqR02IDR3Jq
	vzIgpSThs5810VgJZr/UmwgcVNERKNR/3O3q6UPZNS2gYEWqfg5T7oypUWwbTCy6ljYl8/8aYDY
	YcOPFDBa1dkhP82x1Kh3Sm73/ag
X-Gm-Gg: AYBFou15mICzrp3Xs6r2BrU+YHwAYymvxc7mDlQKdJaHAKASAPRmWswk1wd7ZLR7eXY
	ZbjLiBvrhx3kVUYLEGyanM9jCTMgMuoneh8WrHFsIT35+esufTmHaF8fR0gR+QN5/Q1eSnhvsGh
	E61M9n1OSTCwnSgyc+W1pog1MT6hQDZjZ1/qz9Nz+T5NPjqQTnHJ8fB+IBLiDr8Jh56c26Pt+B0
	r/KVzVV9uz7tZZpuOwxJrHJSKZgqJixkuvv309SdkO4JAnfX3O0PEbodNm79nyI85EtolJrWUAQ
	vdwtZz9tRLdn8jxc2/uOTeSnFfFVTUzeYyYDfh+30deDCE/qcuw26NpJYqVTW0yND6bEyuZPcvv
	LuxnjDWjhFP25fDgayFnYg4AfexZS2OdTxFAaVIb5g3tQ+5+XgSsHt1Sgr6NzlTdM04c6tCdv9E
	cbUQS0o0Nt6+Tt//MqF1P67FH/z0hU2c2p65Mg3LE=
X-Received: by 2002:a05:690c:a18f:b0:825:c3fc:e63f with SMTP id 00721157ae682-88d1ec2e543mr11067137b3.8.1789411386696;
        Mon, 14 Sep 2026 11:43:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-77.dlp.protect.broadcom.com. [144.49.247.77])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-884855def8esm1920147b3.8.2026.09.14.11.43.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 11:43:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39dfcc20aeaso303280a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789411385; x=1790016185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZHVxUjP7ai7HQXDh9w3LrC0rVTP6eIyhyn5Gf7ApeE=;
        b=OvDfRVANx8XpXTrhcuZR/30PxAB2tal/PkoTjJw4lgIuHiQGpx9y/Hy21dhpSYylqZ
         vZMoWL1qpH4eMxRmW519dQV4Z6BFmZ780m6bnJS+PgUW2cQR3hiwJXk0/Ryk96VoLto9
         WO2fwIlzTNdTUBzaOEDtaWmJZHpyJD6DyOPOw=
X-Forwarded-Encrypted: i=1; AKwUvBzYdLIBurrOl2yoxuKFgL1jqu6017IQEDMl5ulzsUZxkeRjQCQZ+qRMLvfM2GP8LeD0i3NGUkIgqkEw8hU=@vger.kernel.org
X-Received: by 2002:a17:90b:5850:b0:39d:fcbe:fdcf with SMTP id 98e67ed59e1d1-39dfcbf80a3mr1839039a91.1.1789411384876;
        Mon, 14 Sep 2026 11:43:04 -0700 (PDT)
X-Received: by 2002:a17:90b:5850:b0:39d:fcbe:fdcf with SMTP id 98e67ed59e1d1-39dfcbf80a3mr1838993a91.1.1789411384448;
        Mon, 14 Sep 2026 11:43:04 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm27509723eec.6.2026.09.14.11.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:43:03 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Markuss Broks <markuss.broks@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next v3] wifi: brcmfmac: Add support for BCM4361 PCIe chipset
Date: Mon, 14 Sep 2026 20:42:59 +0200
Message-ID: <20260914184259.1466535-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260820-broadcom-staging-v3-1-7d5741e37efb@gmail.com>
References: <20260820-broadcom-staging-v3-1-7d5741e37efb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Thu, 20 Aug 2026 20:59:01 +0300, Markuss Broks wrote:
> Those are the required changes for the BCM4361 PCIe chipset support.
> BCM4361 is a dual band 2.4GHz and 5GHz WiFi + Bluetooth combo chipset,
> installed on several mobile devices, such as Samsung Galaxy S9.
>
> Tested on Samsung Galaxy S9 (SM-G960F), where it's connected by PCIe link.

[...]

> +#define BRCM_PCIE_4361_DEVICE_ID	0x441f
> +#define BRCM_PCIE_4361_2G_DEVICE_ID	0x4420
> +#define BRCM_PCIE_4361_5G_DEVICE_ID	0x4421

The 2G and 5G device IDs are defined here but not added to
brcmf_pcie_devid_table[] in pcie.c. I might have been clearer
on that, but it seemed obvious to me. Please add them as well.
Refer to 43602 device which has similar device IDs.

Regards,
Arend
