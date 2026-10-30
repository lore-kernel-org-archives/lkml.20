Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323679;
	b=rjenhGKCJGdT9SBYdehdw/2KZgbqFwXbXkNGwF800am5R5+yPvHWp7/vbuoyLSYWbVpO
	 tLWO/qWXOKfWKAd/qAkdh47MV4LefUv9f44MP+/TLXxRtEbU8FmTSbO2ds2elvmlOiKCw
	 gjPAJ6UdVYIn8c9TETxC8CMl3HBSEq50/uB80EZ8bDHa8rxVFKjCnxO0tOkaPcPMawSmN
	 3yLmDmWncxqfr2wH1HfmI1AjhB+duloisJPA8Nts4N7KxJ6Se2TlLaA2ZidBxm3qvCstd
	 F3IUzXEf19TrpzukJuOjz8fm+fy7J7t2O21iFkHemJR/GgCSPTPQbYKVXr/+ZpP/LTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323679;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-DetectorID-Processed;
	bh=SPMwB1F63UMk/mqUERZdoM/TaXr/V0/rd4WtUg9tofs=;
	b=MxvgPCHkbiBiFtmBfFfPVTuLVxD/+aRvt0E0GP08HV4DvuxaGWpewh60D4Hf1QUO/eaf
	 uN+Ey9ZkvDLhpSnZOyXESXJy8qMp2sfr6Rk8bJApm29+4qxj+5eQ3e5zcoBYgXUlGsGBR
	 iX3CusSxJVlcrV+thsdw8+CEyx5e16yPcCGrzMIhftBrPILuRr1NzUZDOhkyoxYNsReXP
	 OT+U88h7vrBqgAHc753gnnj160iHN6YqxKVafJYb68EbpR8etsM4596uwsQ9UEewiKoIR
	 NrUbET3sSBM6OvIGubtkHInLiQOWHAtuZ9JQ2Rb8dRz8kwl4eFXO3VG1zG2j+mTAvYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FOfYJApP;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFAD606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AFAD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FOfYJApP
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so142984a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323679; x=1793928479;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SPMwB1F63UMk/mqUERZdoM/TaXr/V0/rd4WtUg9tofs=;
        b=x6cLAVGQVdq8IN7Lyj0LFs/uV93MTJ1mbIhHI8GhLKlbSFIi0yShhYhM0Y03qTNrW2
         YLECHm8AzXBld6Va0KSMGi7hM/RbtT7/682fmhULaKKzZMPh8NK30I/JuIQFbfNz2iIV
         m+MbR6qAWlvKncjQ9gnxL7+iKzjrYPKu8fF0eHXsdj0IYMRwWphe4VwdI3VslOZ7ni9Z
         IlaqvVm6tA8LoXiAPcqqTjXpInpNX5fxI257BXSnea+f+K78R7tF4AAjAskgc0QI23Aa
         UyokdSKfLPt3DO2Dk6cGafSa6Nehre8MQx3nCKWyYaqZ5ESKDr3xoUDm6pdTelxiLHb5
         e07A==
X-Gm-Message-State: AFq9FYIHFAkMlfvHy3t4zxII/xCaCLbccdY4EpEA59W1Ud9R8fsqC4tw
	ETV12JzyXF//2hm1V0KimLXjcNqmuRfPJc5inWNIeqY+jHl+RDR+RaWh18ikfFLQHv2cd8KAH1E
	ykwv/IqK8PqEulVcwbarMgqGEMy0bUKqVFiKV0fwItIpF967Wj86wuprBpwLEyMZOfzmSG3YU/y
	9SAxZeuZacqM4Ar4YwxOw94fPfeNgYzPNufSx977FGXzIrTyhf5WYsjQKpiK5dBWH4QCFMp/K/U
	jpJ3JONVWRvCJDdEkhsAqoS
X-Gm-Gg: AYBFou2UHu3p8sNEZUqFk7S2cw+gGW2aIz5ns47KlaM+RsAzDMe/mgHoYy3ssjcGO7t
	wZE76kC8n24yd1wt0wiTCBT0bl77BoPi/ua2xzEDlbwQhECOJGLjsivpA075+6gaQkn5HkvWGyA
	6nulrM1Bs7KKq7qCG8kfXyIizN+27m+SA9OtN74ufzvpfYooDVOTYDy3X7FED93fGKOb/5tZcq1
	rXdqA2PDAl5DCO6reZcMFwnlA6VHTkwiEJkY6LxgpCnd17aNDOEKOvQ1P8GznrS44mOFBKpSjtd
	P327bQvb+N3+hoW3knlE1kF/iui1Wse9hfO3rFX9UWFQBR0Pcgy5sNl6QXCzg6dpzuh8VEWu5GA
	MlB7um+r0AgyH0xkb631LvIPQcMVWR6Jv1AI8V84gskS878roDNzVVO0wS+aiLR+v10zIsmWcJO
	H9hlMTMiUFO/VVa896+8lCL9IciLd5ZcXN3GAvWWyl
X-Received: by 2002:a17:90b:4a84:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3ae897ea4admr503860a91.18.1793323678618;
        Thu, 29 Oct 2026 18:27:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e80415bsm3094224a91.3.2026.10.29.18.27.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 18:27:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso605429eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793323677; x=1793928477; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SPMwB1F63UMk/mqUERZdoM/TaXr/V0/rd4WtUg9tofs=;
        b=FOfYJApPsYYmCA1lmZq73PfiWN9SPB5+thz7sMvVOtHw96ovuG/hPVpqDbr+U0NG2G
         3iN+TdS35brBv3/mrayl0FyrylgVpxFf0StX8180qmTDYyB1hHuzzmRYznTdrBhN0BVY
         HXbT8DKlT44iU2R+1DrzzjudosvsQba8eQfRI=
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr2085839eec.28.1793323676852;
        Thu, 29 Oct 2026 18:27:56 -0700 (PDT)
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr2085784eec.28.1793323676007;
        Thu, 29 Oct 2026 18:27:56 -0700 (PDT)
Received: from localhost ([192.19.50.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm2786192eec.1.2026.10.29.18.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 18:27:55 -0700 (PDT)
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
Date: Thu, 29 Oct 2026 18:29:16 -0700
Message-Id: <DMHS7SIDIUGJ.168385UCMC4QI@broadcom.com>
Cc: <linux-kernel@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
 <mripard@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>
Subject: Re: [PATCH] drm/vmwgfx: Fix use-after-free race in
 vmw_dumb_create()
From: "Maaz Mombasawala <maaz.mombasawala@broadcom.com>"
 <maaz.mombasawala@broadcom.com>
To: "Jayapal Ashwin Nair" <jayapalashwin.nair@amd.com>,
 <dri-devel@lists.freedesktop.org>, <zack.rusin@broadcom.com>
X-Mailer: aerc 0.17.0
References: <48e6780670395107cc9853bf63fa7ac1d034cdd7.1793249917.git.jayapalashwin.nair@amd.com>
In-Reply-To: <48e6780670395107cc9853bf63fa7ac1d034cdd7.1793249917.git.jayapalashwin.nair@amd.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

How is userspace able to see the gem handle to call DRM_IOCTL_GEM_CLOSE
on it before DRM_IOCTL_MODE_CREATE_DUMB has returned it?

--=20
Maaz Mombasawala <maaz.mombasawala@broadcom.com>=20

