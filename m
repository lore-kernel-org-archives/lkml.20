Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792642349;
	b=nd5IFZD0EgkEohWaq8S2030bav3jy0MrHVji0NU2+0Yq4ve6rzA7Sd1GZTVagYxywcDE
	 1Xfc8LUBhJRGPHb9A+PPD5MTmuB4SIOucXTETC3sAjSIFue+F7je/hD1RmRqtHuildeNR
	 ehjPm1IG0fRdjJUHGD5mUAfZuii4gsZAtP8oDIwWejF0XlFG8LLPgT+erJpYTtKFa8bwV
	 TAvFYS4IOSdQXeoMOMRj4R/w3iJPa/NhJZ5QLfmwrKi9VIhiCfAnBcI9AEhd0Mn2ZQE6b
	 JXTq98ZPSyhgLZ5whlVU3F5c+Zlfboy4VlVvkfIphHb7l9JutrHGdAq/oduktV6pAYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792642349;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=T5sh0GSvIKa5QjV6n2k1xFf9oAeZo2G5isZgHBiyq74=;
	b=BhfEroB7oYR7aZZ6PVqJ1T1pr50Zrl/N25jmb8PrtfCA8ox5PlSZTNt6+GSjK865DXMt
	 GLzwubUfkq5qV2ihbx0iih5H5PMkX/NsHgypLsMu8Lsyxkz5NEQ33iRgT4IvhUt8ltwBz
	 7Kx51WOGQfjv2kGokZlwR0apLYBepZW8dFIsPYu+GbhkY4irUn1Ol1xSy5sN/lJoz78o+
	 0V7KUlankc+PCewRifuYrf4YtrpvWK2nxHdg10Nvcl0E5ioZDPk9TukoCq1Y1+BckKLAJ
	 BDkIIUW9x4NQgSRCY0UtuuklurgPOgxJ7BpnoEk1mHCpDy71fJ3sb6QrQNOnJFRrS3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cutW99xO;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3BE606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D3BE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cutW99xO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=T5sh0GSvIKa5QjV6n2k1xFf9oAeZo2G5isZgHBiyq74=;
	b=cutW99xOCt5Ojc5FNWOGYpYZ6OWPu132bAWcVymoKq7KCexsyO/lhFhG4AiUiS
	o3R5FARorTXT5TEqj/96f/k+mEryUNM0+qDx+Z11jxtLN8ItqHpQUIu+TkLI+tl9
	/42G8qsNtcSX0dduwrVN/CmtJid1vKYWBbWJ2d3VsYRmc=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD339jOjNlqoTkoBg--.5005S2;
	Thu, 22 Oct 2026 12:10:55 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	baohua@kernel.org,
	yu.c.chen@intel.com,
	yangyicong@hisilicon.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/topology: Balance cluster static-key updates
In-Reply-To: <94773ec2c845d88b291df265935342eb1a3c9f7e.camel@linux.intel.com>
References: <20261021043834.1140951-1-sh_def@163.com>
	<94773ec2c845d88b291df265935342eb1a3c9f7e.camel@linux.intel.com>
Date: Thu, 22 Oct 2026 13:05:47 +0900
Message-ID: <20261022130547.250531-1-sh_def@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD339jOjNlqoTkoBg--.5005S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw1DGr15JF48Jw45CFy8Krg_yoW3tFbEk3
	y8tr95J340gF4Yvr4Sk3y3Z3srCr18CryUG3yUWrs7Kr98JFs5J3yFganav3W8W3Wruw13
	CFnYy3sYkw4a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_QzV7UUUUU==
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6g9nxmrZjM8N7AAA3V

> We should be able to combine with rcu_read_lock/unlock() and cpu_map walk
> for cpu_attach_domain(NULL, &def_root_domain, i) below.
> So we do the rcu and cpu_map walk operation once in this function
> instead of doing it twice.
>
> Moving the dec after the detach loop should be safe. It only say
> that a cluster domain exists, and cluster code that will still test
> for actual SD_CLUSTER domain flag on the relevant domain.
>
> I will also suggest that this fix be backported to the stable kernels
> (cc stable@vger.kernel.org).

Hi Tim,

Agreed. Combining the cluster check with the existing detach loop avoids
the extra CPU mask walk and RCU read-side section.

I'll make this change in v3, move the static-key decrement after the
detach loop, and add Cc: stable@vger.kernel.org as suggested.

Thanks for the review!

Hui

