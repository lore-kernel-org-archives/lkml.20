Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868143;
	b=03xYylwuUKZQb6vqjf51dPP/KjfFzHfsMZaZ9uxOFDOE1sWQu6mWe/T6ZV4GeJr4KkJc
	 +5Gru2rvFujFusibcoNmce+HNoBUH8uIZQ/jXQ9D+D5SsN5s8upiUz4cFonC0gPOctWM7
	 996NJT59gDS020TCBSOZCyaDcnB5qicZGVl3lJj4S+44pOUECDabK8+MxaEv6zRZ23dVc
	 Z1SvZFLqamHvEYmcnoa5BGFRTQFNnG0RX+vFlTdSUvX/PUooZQibqFxlvosnRI37WSKQi
	 F2ZnYy40dPzPlO5Y8YMkRW6xxO1QRl/D6k7a8T07ATGsy4lS8pc88DsNgqPbksyfuww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868143;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=BY5SPkqBUC/LVpn0704Yh687udlFm9JNFJUu9ANrPdI=;
	b=sG6xzl2cB80vLAddDtmrV2MLJaUVtHSvv5+uzZ2XqZxij9BO4dIt/Dv4a7bXsRKHdNmL
	 gncrGkWwd0v5w2yq4kID7Qg0Gl41zNR7FVmvEm0hooOQMP8IonRGPatieXCiiOU7QuUsj
	 rqfHlYtrTvTSaFymNexFZ0zm4hkRh9cmwcJoHfYdl2/01fhiHjHq37dXgVs0nmKdZx4uy
	 LOKVsrUgVMBO/t9JrJmmLXcRpD/p9TMN5bfQY3nBedtsw67pm4C0WQEMsUZhnF5HmDZBm
	 6SOGDYQqf57IBhWD2/YJ8aq9r4kn0ba5FJBm7iysk5oOpM0KwPEmH6EmyHDZudXLDww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D6A606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95D6A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1102018a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868142; x=1794472942;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BY5SPkqBUC/LVpn0704Yh687udlFm9JNFJUu9ANrPdI=;
        b=tot777VlT5x05vnCmrsGK8TQYbOmH3qarjmeKAtEdF61bywI7B4G4wqp7akcYXm7JN
         CcDAPAzcS6PWNFGQhPidvoOZkYamkkUrJN0vvDu/ocnDiylB2gELPkXD6XbTTU/EUrtT
         SKuS1dzeRu5yCZqkg5p4H+EPobdm8rUBa8RdHn+0QLkT0aUQqZXlkJUuKdXGTux6b//R
         x/Fo6t73Bh2aS+He9QQnY2SL+XU513UPbiXn/v1Y6YJ50gD7Wqfmfni6m+zHyE0G2f3s
         iTvy/psGd5GPrBi0+K9SB0WZyUuAfYFUvFWWrpTgnnxZDD35XS9fEhwb2jS2L0H0II+R
         Z5fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC+r85dOwTpt5LKlDig37twiW1YarJmV2yYvXVPZcTLeGYLYcs7tyhGGPYTDdOJqKurNEYopWJF7DBdUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lLmAFtE1L0bkpX/tYB3267VWWRs7fBOOlWEAtwhzbh3vRYS6p
	YBUV7roU2vwQTeT4NPW7O5wxBY8KZalMM6iRd9zRPIoamTnqDu2FjT5ec2o2VVw+qV4W
X-Gm-Gg: AYBFou37zPFSC5uBAwZCMtSxFXBd1W2qlR5CmzkhN4W1TPNf6ofarVIPUJJJKBm5RbA
	d3zYFlspTb29nXtw+meoCJbXKREYAWDthothq3bI1dTam4Po9z+igoO0UMO8Qio1VlQiIivyp3E
	37SXpoG9Igj1zU4lS/1SD6EVf2rcumJs8mVN30gMJADIrSeFyhbzr+gBWY80Q7SLnXD5T1Ei2RH
	fRUxlJC1CxLC+EAsKFdr2MSGffbpYBjoe0L9atW1i2S5ABdhvPUHwr07ad5mZ9y4DsgUavFgQJW
	OwKkN76thjCSmMwzaQJOVDZa4EvSWTGEbjA6UGDopGu5t/BDpX4ri/kVyaLh4Atn/3ty0h74J+J
	nmnHm1hborc/PguR6Bo3ULpNqBRpnhsKovXAid6repnpbwRZ2p7IkfbeKdX2bKveYXITOwieF6j
	FtilDW5AlPz7MmZacrRVTBMbPVzJitM97dGWNk/2wgkxiev2+He9vaFJHr70n8dpuRlTWRhU16z
	imdHeLegkuOy/4Tnq/v7a/I+6DJXfAtvsI0xZ2tFoKgyK2zQgfnJXVnmK0hP9Yl1BE4TJ+yfav6
	KHJbGI08r6tgcVb2FtxbLJVpUFLOMoEFkS1RHkUea5IoxfFTzUivF41MPmCF6JNqvcJ/ojc5Q2h
	sDKohZ4T/vkk18oVg8c1DODTxAxoIaY0H9lqsQxwH
X-Received: by 2002:a17:90b:57cb:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3ae89744ca2mr15840169a91.25.1793868141815;
        Thu, 05 Nov 2026 00:42:21 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32812a6sm2720088a91.11.2026.11.05.00.42.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Nov 2026 00:42:21 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Li Ming <ming.li@zohomail.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>,
 Ira Weiny <iweiny@kernel.org>, Richard Cheng <icheng@nvidia.com>,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 2/2] cxl/edac: Mask DPA flags in the event record cache key
Date: Thu, 05 Nov 2026 17:42:13 +0900
Message-ID: <20261105084212.55292-lm2-ai@linux.com>
In-Reply-To: <f4be9108-e5ea-4e6d-bd6d-0af14f28951d@zohomail.com>
References: <20261102123233.74598-1-ai@linux.com>
 <20261102123233.74598-3-ai@linux.com>
 <f4be9108-e5ea-4e6d-bd6d-0af14f28951d@zohomail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Ming,

Thanks for the careful review.

On 11/5/26 16:20, Li Ming wrote:
>> +static inline unsigned long cxl_rec_key(const struct cxl_event_media_hdr *hdr)
>> +{
>> +	return le64_to_cpu(hdr->phys_addr) & CXL_DPA_MASK;
>> +}
> This function actually returns the real DPA of the event record, I think
> the name should be cxl_rec_dpa()? xa_load() uses attrbs->dpa as the
> index, but xa_store() uses cxl_rec_key() as the index, that could make
> readers confused.

Agreed, cxl_rec_dpa() says what it returns. I'll rename it in v5.

> I think the implementation of skipping unrepairable records should be
> moved into a separate patch, and this patch focuses on using real DPA as
> the index parameter of the xarray.

Makes sense, I'll split it out. I would like to put that patch before
the masking one, though. Once the key is masked, the DPA from the trace
event matches a NOT_REPAIRABLE record, so if the masking went in first,
those records could be repaired at that commit.

> My first feeling is that we should not simply ignore unrepairable
> records without any logs. But I am not very familiar with this area, not
> sure if we should report this repairable bit in trace log or output a
> kernel log while finding an unrepairable record.

Good point. The trace events already carry the flag: cxl_general_media
and cxl_dram print dpa_flags='NOT_REPAIRABLE' for such a record, so user
space can see it before it requests a repair, and the request then fails
with -EINVAL. If the maintainers would like a message on that path as
well, I can add a dev_dbg() in v5.

I'll wait a few days for other comments before sending v5.

Thanks,
Jongwon
