Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B90D443C1D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387990; cv=none; b=OgG7byp0Ouy83HXgDvSTWR7UMANNGYhiIMjGA9upfI0VbeGQbHV/24hFzXIcNwR6fxvOGiOXSOiO2Jh/dDQsyX5VlY35bAKKYkZx7u07hLKNv0XYNDxhWmz3tAkY0Z1g8gpNMeogsx9d3kNEUyQ0Tj9rPT/ZsbCD/wOl5ef4TZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387990; c=relaxed/simple;
	bh=cVHon7VDK4Ubn/hizIHoiP5Bf1pk4Ica7xPQMA8ZqW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q096iVF49Gi2434SBk9GKtlGHIa/PbfpcBOPXfERfHNIUC2NF9ZMmenxv5gxCh1ZNE5I4svnTNCqiI3xntsEfitKYZkMNBQyL/5VQxaTdnO/cVU3vc+STW0MQTeuzfusotaD/z9JEWLGnTgt3ikPG1WLSQBpl4Dof7UI0TdG6IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=rOMhfQTH; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="rOMhfQTH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=4oi1EUOwKLyy3XbCu/PFa4od9jFdDv98HlWs2bjy0nc=; b=rOMhfQTH+K8eIz0tm+CvKRZPwU
	8itLH0+zZZpwuKwG+ih/cR2MtrDhoXExrL5GaWS2jhtdk+9vmLGdWVNKbG6TUlS9drY+ovzX7Xmab
	3946ahko8U2+pq1oRLLwD67/uyT6FQk/7Z0raqlokZw9Q2wET8Iqp2adLR13GPLpNKmF4lsAT3LBh
	NfcjhkjTIyDWOkiXWhgykicn40LKR6ritSOAUwS+ShKwb+YgItwnuIoI7/ncwX7iMx3by7VK5rpii
	UcR+CdV4ihyxL0hMWrs6Vh3FtrrV11eLSOvICYUZWkbe0+y3LjKCeIF34lmKqeqmqxAOwDshiKPxo
	rcoa0BNg==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x65YN-001sJx-Ev; Mon, 14 Sep 2026 14:12:55 +0200
Message-ID: <f86fafc7-3e42-47b2-aca7-e0b4be56b699@igalia.com>
Date: Mon, 14 Sep 2026 13:12:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Increase drm_mock_sched_job_wait_finished
 timeout when CONFIG_HZ=100
To: phasta@kernel.org, David Gow <david@davidgow.net>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, kunit-dev@googlegroups.com
References: <20260913084155.520015-2-david@davidgow.net>
 <b4f017cc-3dbf-416c-b456-0c19d2f0647a@igalia.com>
 <0ce1883f-7de3-4a16-82f0-c8950459163e@davidgow.net>
 <f570ea7f-164c-4232-85d8-14604baca607@igalia.com>
 <26926372f9d375e1741b16abd2a910f3754a0410.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <26926372f9d375e1741b16abd2a910f3754a0410.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 14/09/2026 12:48, Philipp Stanner wrote:
> On Mon, 2026-09-14 at 12:21 +0100, Tvrtko Ursulin wrote:
>> It's not a loss really to
>> skip the scheduling quality tests on more platforms than strictly
>> required so I'd say lets go with that.
> 
> Does that mean you agree with my idea of having two options for
> building the tests, one for sanity and one for performance-ish things?

A new kconfig? Makes sense.
Regards,

Tvrtko

