Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C049A509F18
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166943; cv=none; b=Ch4vNFI4pi03M8mj1uViNFqlnVYt791us4D0r145FwHhnpjL1dUw8VWy7vptiNVh1qv4Z0/maf5d85wzG56ue8wtyTcVHC2xLhAdE5T9ieVNZVd5eQsH4Mj8LHpBvag4xvTq+o61d+YEzypO6sn6/yJVRpIyzIBl4yyhO2+wC4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166943; c=relaxed/simple;
	bh=szFBXro/rSTYjHAQMGTLHw3nMlQZ07NIOfznFY0g0DU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M81Qkd4cGEx4pVzobYW4LWP9czsKhNY4gr8UTJGY4T/ruZVIHEZgIGu1Vo2HVetSctoOPLL0+kW+9JsQfBOd3gwPbsFM5KYWbTAAEJ/Wi6U8uiH3TDldSDPaTUbfFMQ2VaSGNg82eP5f8kXQIHd5B4A0bzcAw0wxML6Mm2rNUTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQ6ck7tF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQ6ck7tF"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfdd431dcso517072f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166940; x=1792771740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttmMFkFYZs1qc4FswsXiJbWUTRZVrDxwrIXbqrFBdtA=;
        b=rQ6ck7tFRCG3pt0ihngKB1LKx1QMCaQSwMi8mZerNB2iLRCiXLinqLgpkK7jx1C/5E
         CQL+zBj/Ejh/sznP2RmZqyuWSLrWcrMWhsp5cT+SYM8y7RsY0Kbwg7Z7/Y6sae0Bvmjv
         f2qTZnwsx0W+ZYTThDNffXVO6d4KT1MzOYKMfRzK9xJYYnnCbLclALkQzSv8WiVtCpyh
         0UE24mdWcF4OsBfEAYVrTqSmEDVdIPGD7+TFx8YPlx/ew5n/GCQa3wkkiZfyo+Y14USZ
         5hSGDeQwk72UMp8uF2tEbvKq5Nj0Q9MVzFTdnWSUP/hXE37fEMkmpX4nPE1Q3i94h+bn
         Lbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166940; x=1792771740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttmMFkFYZs1qc4FswsXiJbWUTRZVrDxwrIXbqrFBdtA=;
        b=1n6qRfiqPk0pQI32/aqgw01CzGHPJQBreyXJ+3lekhkdFe+0C3pbRAPYm3r26NU8hf
         33wKDhhYlavtahpwU+nDhT8/TdUThrG4MeA4rk4g1MwryRORBPZGLmjDzoS86tlsABJZ
         jxPZW5rT0Kn2f9wqxNSUhrCrR18j389kq6QpFRgfqk6v4Fkeoi+jnB9uwWcM5f7eZ0sG
         UH1W82DeHtb+QNPIUAUtMU76LKy+OIukXhMYKVKNT/lH3nAQpexQFaq2bFfG3tEtmSxS
         EU/X0HOIkIzy5pEhaB4LJUS2WARVhd0u3HqbeQAisY8JPyYgKizPd88vw2ElL72uqIAl
         IhTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwU8XzIthM1QOYhScnQ4GksDyfTf7y7y7pq9D6wVPspsDOSdbQyYzTPJBXGz+rH/QCsL8q4ad5BUDXm5ck=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYIt4XoZtaKiUBsOC3oniQJ1Bi3hgIji+mCLZ8Wtz+IBn844Kb
	CiKlYGITzF3oyId90gORGHYotP+0ofGzHGksGWzZRABuYbavx+Gx9s11
X-Gm-Gg: AYBFou2GRSUhSLYyKS7syEV8ZEf8IjIDdkDjXOBuGor3gkR0SV5FjlAxfQZFsr06k4W
	zqAXow15GvRs9cny5Q6luvBMeTDAxil5Rj/P0uq2h28romnJ2cY91NeAP/6laueg00Ah70ng5tl
	uKv+5SQWGP2x0r14mOz1y+oPgHjXUfmR4xle0x/F7Dm9VJro7hSrCqHTp4DGFo5HupaufO7gDs/
	UbihRrzEPYEPhNwBTpnI77Yk874VLIt93mta+szginWFQaXVpXkPvHtEhp3rHbjRCmEXvz9TbKy
	G6tcNFrbm+7ECSDdLjL4TCy/PiS+6MoUQL3jPUbT11fRIbxIINfqE7Mgkf4mDLy/HDInsK86361
	D0wrrSXxCNvE+C944P32VVtsz2nbBxBOOkgBpt+yP4YIyt9pWK4O+hpmBzO79QhhSAEbJbk83fP
	0y0t4DnHPwHpKDVNFOYrn09cFmJ2PICT1CylVrU+2mTlt6+VijhovcRPzV3LyCf8OJ7ob60HOT8
	fZZbgXquBqQ/HqcByT+jbrOZQ+3wCDuMnc9reHqASAorhjybMTvEwA3d6aCdf+Ner2TeIKn
X-Received: by 2002:a05:600c:e548:10b0:4a1:d766:758 with SMTP id 5b1f17b1804b1-4a1d76607d5mr3809095e9.16.1792166939897;
        Fri, 16 Oct 2026 09:08:59 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm6779011f8f.8.2026.10.16.09.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:08:59 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	tjose@qti.qualcomm.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] phy: qcom-mipi-csi2: Add C-PHY support for X1E80100
Date: Fri, 16 Oct 2026 17:08:58 +0100
Message-ID: <20261016160858.193572-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6564f9f8-6ecd-4912-b029-c92dfba792c1@ixit.cz>
References: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com> <20261016-x1e-cphy-rfc-v3-6-40a346a72153@gmail.com> <6564f9f8-6ecd-4912-b029-c92dfba792c1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi David,

On 16/10/2026 16:10, David Heidelberg wrote:
>> +	{.reg_addr = CSIPHY_LN_CTRLn(1, 26), .reg_data = 0xf1, .param_type = CSIPHY_DEFAULT_PARAMS},
>
> Thank you for the change. While the lane being decimal number is completely
> fine, I believe the register passed should stay in hex :)

Agreed. In the next version the macro will take the register offset
within the lane in hex, e.g. CSIPHY_LN_REG(1, 0x68), so each entry
reads like the downstream header. The object code stays the same.

Thanks,
George
