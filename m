Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728625304B2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170219; cv=none; b=IXGOj/nptBPCl7wA6J9h4RLw03NABm91S9jObR8tdLsmSEckwYHBWyRxvZ/cPhcGJ9JN1WayEuAeh1BQdJYXwF5ZFpJljWOZ2JUg7CLHDAsmI/XAX/J0aSjXeG9vHTfH2J1Ww8S6oxNokm3EGC7Trm+ER/IG6yEC1KRWH9oU854=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170219; c=relaxed/simple;
	bh=tFpSLJd4KzT2EQLI4Mnw+jxQCxhohjwg8m7rnfH6i3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EaDPrEax6ZO9R9fncjvExicNVJj4mUsw+tKP3IPLMqxvg0DDIBHGKIC52kM/TN396sJEUPmAOSbQskPYfCexkXZjIhAFMmUCzOAHQloVEWDsKjc74oo0CsFsriqCdKyePrC0RzlL+CsHjnB4fOezi6GZWk35srXUh2wfB7qTxS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWlC+3UG; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWlC+3UG"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85e68bdbcc1so9889367b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790170217; x=1790775017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zidhQFtMBqWpP4LRT4RaIsC3YDKSMIQiZYuG7TAn+KU=;
        b=lWlC+3UGvBh/nsEnuwWYxBhHp0VhkD61/qc3vfpVbTBwZAMidL6XvvQ9q59jVnV4F1
         hpL03Y03v0Vig1driAwF2h84iIA+6XXDOgrB/2+1jMSVxIZhMKvWGOKR1EouVVEjmwKd
         2gl0cVFr/NK4wgjQnezfb3XCAfDf0yMfLCMHoZwYVwxkVi0hzhS0pUaRwZkCCDW/IIL/
         sLSmC9MNm0qldzon56tMxks6nTc0AqifoQruEocX4WnDVLVF0kzSNlJbVJ9bAQL+yEFD
         FsS+l+YPFJL3mYW16kLyDv8GSndcLdgBOF/JqRMp3aZCrWEQ9e72LQnWmmlb2s+NHSev
         9+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170217; x=1790775017;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zidhQFtMBqWpP4LRT4RaIsC3YDKSMIQiZYuG7TAn+KU=;
        b=UqycI+lxl0f0nJWXq6oPT/ql17GtBq62fSoBd/HealnbBMTKr05mYmO13LHwRObnap
         tYn6662VD9FVnBkc36zwE07C/ORs25eS9fArC9dQBntWyNZ8QQPVxNr2jqbK+RL2iVX0
         8qBtoqnN2CUXiTn+oM93nqpi/2+eNHRj/dvl+p2F/VpUxAhNxLDFN8G03wESS+2MbTzc
         gU05u5h9vr1k7uXpy/T+T7KmLNjpsxSuCOajZ7PfRPpiQSaPez8rAY6gSKSMK4QWzXwC
         9lYfOJcox0xExv8I0P4JragVoj/KA6+bJgRN/lQuOOvdJR44EsT1ni+9gA4STtrTjZ8F
         QG9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz500YZLIKtDy3EZcS7DZVMi+VDnwHRlJJ0m6mvqN+LlQmmtb/bMWwHAoXTLvb6maUFrt5yjvacBcl3RKQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nxSaCj06c8A7gRcG7PJWE30M7odC1ZEtFL9GnAGZ7F9dW7WacL
	c+j+j9VXVWe8ZeLxs5WSdEMc+nGSferaPAs6CXfboT/lEUCCyE0Hq7mh
X-Gm-Gg: AYBFou3naJQHCyZsOZ2zs4KGDcdA4qkfmU3bfriK/VgS3Nwvs2rwTbymwizUTIMGD1+
	I0xNXjB+5H4LcdibnKhQGxZsMFwUcHkKQQEjclY7FDTveCp/vuC2y3uSTQP51kEFcSiPvKIfTv0
	FeQPClRu89UbTpAZX3Fowh5gcQHrPyIFFMpJKY+PMVzt6zVw47cW5PU+ZEJEqs/tFvf1DLs7tQP
	4hhPXk5QgdJM1yvpkcsrY7pLr7fOexf7jUgBDBlxBIqmY1TMqNCggqKJk1eS92hbLA3hTlSD9id
	Q1CyG/5ng3z7cfHBBxqQ5u9+8r/CuLwV4iQH3EsmvznBGIy5fkAHEaAZ3Ti6z7esX+PBReHzsTi
	tGyL3mxjsWEsl4OrNFW3rItJqIjAPeZGkkrkXBWuPJJlTBybinA41YWdqKoHEg6HmUjcc5AGiVX
	MDjgbJ0oh9VtiuN+7/CwEhmyiwx5VT3S5VFxPTay2IJBRBmgmp5pn/Li6zrKX7uj/ECkykFGP5w
	otcEwPUFR5kBGFeK4tWItaJqtOvcA==
X-Received: by 2002:a05:690c:4004:b0:89a:63da:cbec with SMTP id 00721157ae682-8a45c270a06mr12544017b3.50.1790170217243;
        Wed, 23 Sep 2026 06:30:17 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a466ab7e7csm9385007b3.44.2026.09.23.06.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:30:16 -0700 (PDT)
Message-ID: <5419d3e7-bd3e-40a5-a15d-397e9019b3d5@gmail.com>
Date: Wed, 23 Sep 2026 21:29:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] mm/truncate: clarify return value of
 truncate_inode_partial_folio()
To: Jan Kara <jack@suse.cz>, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, hughd@google.com, baolin.wang@linux.alibaba.com,
 willy@infradead.org, ziy@nvidia.com, bfoster@redhat.com,
 joannelkoong@gmail.com, djwong@kernel.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, chengzhihao1@huawei.com, wangkefeng.wang@huawei.com,
 yukuai@fnnas.com
References: <20260922110703.468389-1-yi.zhang@huaweicloud.com>
 <20260922110703.468389-5-yi.zhang@huaweicloud.com>
 <5pthbyxtn7q6xi4fmkofvksmcjzfnujcw2g4fxmxjzfin5pbgf@zui3vcimb4cv>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <5pthbyxtn7q6xi4fmkofvksmcjzfnujcw2g4fxmxjzfin5pbgf@zui3vcimb4cv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/2026 7:58 PM, Jan Kara wrote:
> On Tue 22-09-26 19:07:03, Zhang Yi wrote:
>> From: Zhang Yi <yi.zhang@huawei.com>
>>
>> With the earlier rework the callers no longer rely on the return value
>> of truncate_inode_partial_folio() to decide whether to adjust the
>> truncation range. The pstart/pend out-parameters carry that information
>> instead. The callers now only use the return value as a flag indicating
>> whether the loop should be reset to pick up newly split sub-folios on
>> the shmem path.
>>
>> Return true if at least one split succeeded, and false otherwise.
>> This clarifies the existing confusing return value semantics.
>>
>> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
> 
> Looks good to me. Feel free to add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> 
> Just as I'm checking the only use of the return value of
> truncate_inode_partial_folio() in shmem_undo_range(), the code there looks
> fishy. It does:
> 
>          } else if (truncate_inode_partial_folio(folio, lstart, lend)) {
>                  /*
>                   * If we split a page, reset the loop so
>                   * that we pick up the new sub pages.
>                   * Otherwise the THP was entirely
>                   * dropped or the target range was
>                   * zeroed, so just continue the loop as
>                   * is.
>                   */
>                  if (!folio_test_large(folio)) {
>                          folio_unlock(folio);
>                          index = start;
>                          break;
>                  }
>          }
> 
> However if folio was say order-2 (4 pages), lstart is inside the 3rd page,
> then the split done by truncate_inode_partial_folio() can result in order-1
> folio, and two order-0 folios. Hence the !folio_test_large(folio) check
> fails and we won't pickup the new smaller folios so that we can free the
> 4th one... So I think we need to unconditionally reset the loop if
> truncate_inode_partial_folio() returned true.
> 
> 								Honza

Indeed, that's a good point. Since this is a pre-existing and
independent issue, I'll send a separate patch to fix it.

Thanks,
Yi.



