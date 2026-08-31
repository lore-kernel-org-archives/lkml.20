Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE11536215E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788203809; cv=none; b=p7kZm4INeKrJ9GXmy5WUY+QHwQW4S5YNWct6fIpmkdLl9p/QkRA6NcqHU2OAatthEJHRB9ouzfvjv6qnXnDnnKwQsrP5/veHPAyn5Karc2RcbZybbCA4MkOuwU5FGA0kZuitMc1REVCmZS1nVFlyJ/PJ+/nMCYj20CP1RWgnjUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788203809; c=relaxed/simple;
	bh=1l9Qnwy6fOAZnRDv4fKE40BBxLJirspE0kOwbtTf1+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/OifLppP3pLo6MPy1pn4U7BW0B7ylK3a5zc+zIyyOov2K1rNbN9lEmSRFn7YkegEuau6v2qfrs1imi4s5BDMZVKHxxApUZd4sblkxFYudNPUE7Iw7iRHK6y4vcFDiAdY4tDJt7bcNzj61sL9OM+YoB8s5CgMa1xo3o2cL5gSCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c73zA0c2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c73zA0c2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d7200b2e15so41614265ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788203807; x=1788808607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1l9Qnwy6fOAZnRDv4fKE40BBxLJirspE0kOwbtTf1+s=;
        b=c73zA0c2imTcdYHBeUrTbd6ciNNKrN5ya7R5oOBJagOWAZPJ13nFiI2MaHTIbaLNHA
         8W+rKMjeXEkxRGmuAuUpL3NxBXUGl12FQuN+5ixncPGOKzkIFyYvoJ5aicBkp39WSc/s
         4BqPdYivxAQlI0BVMTYUNBitEnIHAVjuE5B9/S0jtohLbIwr9VtdlAqTQ6d+fRILLC35
         ms24rpjYUqXg04wOhqBp9Rb9tZvk88PLtCOxWLg6WFkz+1t00teBNFLT9ZMrIUBqJ2KY
         30ONvJyVTCs2toO5l3Pqq1V1duq0e+0k7tq3dCa0nQf0pYwyNqfmL/5FmSVO/OEK1YS/
         wJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788203807; x=1788808607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1l9Qnwy6fOAZnRDv4fKE40BBxLJirspE0kOwbtTf1+s=;
        b=HV0BzIQd4UoKVCrVbcxM9jpcVOmRfzmnnOvDZAlxaoyoTZPXAMLuSKGHigGPivVpXb
         BV6ie7ybevz7qpyf++DqQaNyrGEZMx0MD/cypj8kvfwAvXDR71in2E93nsNWmLvfV9Op
         oEarcmpRB9a63Xk3h3ijTSgIrMBwnuEnRf2zdzLPkpl6yepyzY5O0j3qI0bwy3aYLyrv
         oZqPDZ8Zz87P6FFmdHqO/27HW0ngIPm1qZ+1ZYfTKnv2LjRv6L9RqWNZG90Wm0Qcvpvt
         jagBIp1fpFTEHsJnsFYudpbklHH4TYCE0OUgZCe2ilR2PmnA6zTHxq5zu+P8+mPcUtYh
         DI+Q==
X-Forwarded-Encrypted: i=1; AKwUvByN1KZdKQ5yHmWAPNQfPA+MAZaiY5yeZHwFTDbPiHh3HuXy2I2tK+G3tip0Vx097dW2fg0QvlGnTSzC4QU=@vger.kernel.org
X-Gm-Message-State: AFuF++nOUxft94kQFtk+K0XyljjSTI58e1uQYowZwWf+QpJKVSviz5wA
	df0XYjiADfIsn9jXKbLRV0AwyEoO7GyxWcio6+deWEOshm6EO5R4Euru
X-Gm-Gg: AYBFou1cTAbYvgg1sX2EmIlUO0rgLghMRrEzlCkNh8in6rjubTFHQ6RWsYYo43vp2eI
	RqX2d9xIUC8BRInZkGaoUE4ICmZSnTpWaO7+8aRC1p1FbANR3lhSS1/0DnnnaUbaFkBwXRRcCtk
	1R8JQYT2QADNBFLwGa/oJo5m6keCX8mxB3ancabyJP2kOLniu3xg3ZYYY5pmV6dOEHQrpdHlbq2
	AaOC5+BYwWc6Qg1ix1M1zZo+2XQNzM1lmvzQb0eyH1Tr31m0/4vZkY7AWaL5Ofn9ziZQFQ7uOfZ
	hDH2s6HD6Xar8h7IuYJAwAZqFy23PM2Aj1e/rQo7hUaerAPc4W8LFww/9uFVtOv69exWnanKUpR
	SvHaysKVf540R+YB0d2uGcO+56gL0BcVarOrL45o6l7t7y5Fh7c58SffK4LJAnZ0suOAGNLxYTg
	HjpxxZS78wbmeM97cEBkg10EloZy6lnsC5AtmcmRgk7uQfiS0DOmCpbYdrY6DzXPoR1v39Kotto
	LvC8M0Q67r3gwBa+tJ7Kx1zBBC6
X-Received: by 2002:a17:902:d54c:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2d94a904a83mr39320705ad.16.1788203806601;
        Mon, 31 Aug 2026 12:16:46 -0700 (PDT)
Received: from localhost ([2409:40c4:13b:7a31:95ce:ef4b:57cf:6fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759640becsm40286735ad.36.2026.08.31.12.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:16:45 -0700 (PDT)
Date: Tue, 1 Sep 2026 00:46:42 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: jikos@kernel.org, bentiss@kernel.org, rydberg@bitmath.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mayhemandcoffee <mayhemandcoffee@gmail.com>
Subject: Re: [PATCH] HID: multitouch: Add report ID mismatch quirk for ASUS
 ROG Z13 Folio
Message-ID: <apXSkmMq_y7Lq8cV@eggarch>
References: <20260804202031.75738-1-lovekeshsolanki00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804202031.75738-1-lovekeshsolanki00@gmail.com>

Gentle ping on this patch, just making sure it didn't fall through
cracks.

Please let me know if there are any concerns or fixes on the patch.

Thanks,
Lovekesh
