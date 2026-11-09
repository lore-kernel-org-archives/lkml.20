Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217367;
	b=F4D40trQKLJVCVgyDi93wZRu0eHH3SHmDGCN85jH/pSDYE0ajQ+Z8k0CMf9W42AUzpun
	 ubMIhIkzF6FLZcZ6CdE6Xsa3f5slIlU7gcDrl2c/vdCTdHbs0K23ja/ZcxaCMHREkApL7
	 FiU+kpxqLMdnSI3kldnHabUCJ02y31eniYbDv318AOoNSob511V/4gB4P1kIjA0MKym71
	 pf2hb0fS/2u3Q7SwPqWvAlQLx+x5iKJzQT7p89rkk7H/OBuHLlQujZiDDaMjZS3GcafeQ
	 HE//7IeCobpKmsVvy/3sHN6Af2ouEcidt4HJm0eXxqvY3L/N8jM9R/gYw3znzXBLy2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217367;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=WpuS3tl/9SY725+kelTs43BOQAK8wOu/36MUkoQjfOg=;
	b=AoBEf01C+PPcul7kts/KMswVkhVx4WzHziZidLkEfZCwXjpdz7VaynlAtpYO5je8AD7I
	 rae0Ql64swqBkhERJRPwIG9dv/vxF/bwXF1Jf9OIv/apzf0C1RNgFDMRbNWsSrfYa5V8l
	 f/Je2njyLUGqY3XlXK9SrpTMFC7FaU1p9/BAs0uTEJnFtckDjRwZyqt9hs5tIM17UdX5B
	 Svi6MhMaQG4zTHQQk+Z2/ehRQU1DRRXYUDzImR3pT1luvkVxKPubNLDeqg2BdYpQteKIS
	 MSTE+Wy9t1YnxCP68PA32xwVc8q80rnFiWENGcRuwgrmpqVXSJtb6N5CKfvKlVPe0nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=kpOWn2NN;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BE1606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68BE1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=kpOWn2NN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=WpuS3tl/9SY725+kelTs43BOQAK8wOu/36MUkoQjfOg=; t=1794217365; x=2109577365; 
	b=kpOWn2NNm2+n91dEwQsodoJHYfuCVmNwakjY/kjuIqGMU+L6AFPG2Q7Tj7SSDVv4gFXxy05Dqas
	UgZ7LduGtq6quo54EKWKRaetGPvFc8hUHw1pMExKE8mDyc3sPUyhOErBGZOk7dScmNd0ELlw+nBq0
	zaEF/X50NNbfRBMjz7oG9AtBLXVmNxIktQoPrQjKifkiMfGlYjT0s6rcmzJKM9av7eE7I4l4uUSH/
	+pndsRAva7A3hEh1b1pYdg6vtAJGhhVJdPkY5PIPO7orw0zambnSITFxdfciWnQYeo6Wa7ouQFtMj
	HUXXF5hJueBLQ0nBKrHo7irlEvgPbHMC9Mtg==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xQLtc-0077wF-Oa; Mon, 09 Nov 2026 10:42:36 +0100
Message-ID: <0173372b-40f4-40d9-b99a-23e29310e469@igalia.com>
Date: Mon, 9 Nov 2026 09:42:35 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] workqueue: Add support for real-time workers
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Chia-I Wu <olv@google.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Matthew Brost <matthew.brost@intel.com>, Steven Price <steven.price@arm.com>
References: <20261104095225.32654-1-tvrtko.ursulin@igalia.com>
 <20261104095225.32654-5-tvrtko.ursulin@igalia.com>
 <5582fb8a609eb8a2348811ecb6f539a7@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <5582fb8a609eb8a2348811ecb6f539a7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Tejun,

On 05/11/2026 18:50, Tejun Heo wrote:
> Applied 1-4 to wq/for-7.5 with the code refilled to avoid unnecessary line
> breaks, HIGHPRI_PRIORITY renamed to HIGHPRI_PRIO and RT_PRIORITY renamed to
> RT_PRIO.

Fantastic - thank you very much for the support and patience!

Regards,

Tvrtko

