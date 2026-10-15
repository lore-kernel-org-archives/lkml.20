Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EAF361657;
	Thu, 15 Oct 2026 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075262; cv=none; b=GVaZXe/0afPYtWOxaHlU2ghcfD/8HgcyoomtwQ1J9AtGhXvhEQHPMJz5gOje3VjpwmTVwYcx41w1Fl67YMajysMVcPb0/vkBw+a595cJtThbdaT8Etl4eYWMxG0oOPohXkqSDsOVaansSahEhqXNEEk/XwUEl2ZJ/B9q07X+l30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075262; c=relaxed/simple;
	bh=dqYqBUhFvXzvKQ6oa6P1QiNYgA1gHz6Oac8CaI75JlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mc/LsTKukwCMuPRM6G7pgcLZuU+BTA5HyBaokP4ocZBklNLrWBq5jQ5Gjkic+bhegrzNzskzzrD/JLT8hIO7VbNyEfM19hMuPXc6D058aPqz8JWnuNMts62BsnL1MG5BLuE/ke0xx6aB6oTmVo69CbMJ+h7gnD1WdsOJcKG3Vc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37F61F000C4;
	Thu, 15 Oct 2026 14:40:55 +0000 (UTC)
Date: Thu, 15 Oct 2026 20:10:53 +0530
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
Message-ID: <atDl9clfABlLMgkC@sumit-xelite>
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
 <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com>
 <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
 <d293c3a5-7318-4ef4-978e-2bf1c064d0fe@oss.qualcomm.com>
 <CAGptzHN5uTR8w2b3ODHoSTcys4woRBmAf0fa=93H34ZDV+=ymw@mail.gmail.com>
 <9ae0c4e2-35cd-402e-96d0-eccfe26e622b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ae0c4e2-35cd-402e-96d0-eccfe26e622b@oss.qualcomm.com>

On Thu, 15 Oct 2026 at 11:43:19 +0200, Konrad Dybcio wrote:
>On 9/18/26 1:10 PM, Sumit Garg wrote:
>> Hey Vikash,
>>
>> On Thu, Sep 17, 2026 at 5:11 PM Vikash Garodia
>> <vikash.garodia@oss.qualcomm.com> wrote:
>>>
>>> Hi Sumit,
>>>
>>> On 9/14/2026 11:44 AM, Sumit Garg wrote:
>>>> Hey Konrad,
>
>[...]
>
>> The main disadvantage is that we don't want to carry these custom SCM
>> ABIs per kernel subsystem with the open source TF-A/OP-TEE boot stack.
>> ABIs always come with maintenance burdens, especially the custom ones
>> we have in this case.
>>
>> Since we started from scratch for the open source boot stack, the
>> motivation is to keep the TZ ABI minimal and that too with
>> discoverable OP-TEE services like the PAS service.
>
>Okay, I can symphatize with that.
>
>Let's think of another solution though, as a strcmp over the provider
>name is 10x worse.

Okay, I can rather stub these APIs via the generic PAS layer except the
SCM backend, that can reuse the existing abstraction.

Although I find these APIs not related to PIL/PAS but however it will be
just overkill to have another abstraction layer for it.

>
>What is the planned replacement on the open boot stack side?

In case of video subsystem, OP-TEE pseudo TA already holds platform
specific info so we can directly add this info there which is being
passed by the kernel in SCM calls.

> FF-A lend?

FF-A surely is being already enabled and tested with open boot stack.
See TF-A PR for Lemans as an example here [1]. However for FF-A lend to
work in real terms when kernel running in EL2 (KVM mode), we need
capability to be able to unmap buffers from kernel linear map.

See this proposal from Google where discussions are leading towards to
make the generic CMA pool capable to unmap buffers on arm64 here [1]. It
will actually unlock FF-A lend use-cases in the kernel.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/54873
[2] https://lore.kernel.org/all/as4ATqhp0bPI03PA@sumit-xelite/

-Sumit
