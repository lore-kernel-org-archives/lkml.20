Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793538521;
	b=5foXvNa4E1RSqeEtGa+cULJKITTgBEW6VY4de57gARkBZPkw/aGkBX3mxN/0LFv7v1Dq
	 truH65J44rmFF8XvD+OsljV07V08sIJA0GZCOIvhCQcqv7mzJTlksdKwXm31wRqxvQ6aM
	 lbYw4O5/9fKg7wNyGPKjLyQcAxpr4cbaWXKQP1/84VfVCOWrCC1N1PhqTT/5c5q2HR4R4
	 9N0IvEiThVPInVYUeEbWOjrG6QopALOaPsO3dj2A2MiNQkKxNqXTfay67EL5ws8LnUAMJ
	 MFEyzTey4FtfA2iWYJNiKBKxQJn+CxyEQmkNSAakmFxAjcBwDuD/0y4eid6PPzufEag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793538521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=DN+73IopgojkHF5owDqrZcQJFph061u4C7fIX+4pVMM=;
	b=epQLM2qB/pt9JObXxd+buWN1kluoua4UroPqB1WfEPSKQBZHBoFHt5LEduZXs4ZhMn04
	 Bn+O1y84Nvw6hZTtumvLbVV9lhQuL7ROSZY9aW2Ydj7xNV5omAtNoZATS/FY3lhbrQNwv
	 vbxcEkZ3c6Snw1Jmsp0xJzxaaIjcNU+micJVmr/TUlGa4DhgyQbkNEnWKNP2wIEQEcD/8
	 WdDeYb3hzCO5PEmtQPDglHKXwD9JnXoYxNWRznZBrIms1PpZj9KGTj4M9P8NJNO2+zQLu
	 Me+50gTYgHvnu96UU+JJts1R9IR1uKspDlWtSle5zOuiJnOJm+PwQPvaxuI6QHsi/CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ui8X5Z4V;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01D0606A329
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D01D0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ui8X5Z4V
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so2287077eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793538520; x=1794143320; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DN+73IopgojkHF5owDqrZcQJFph061u4C7fIX+4pVMM=;
        b=Ui8X5Z4Vcsi3afFDuZP4c7n6Y1u3hrIwd8imnTwYv527JuxpSlDa2Nt2iKqKLIeSx9
         LGWnxWwerWrqDvDtxh5ZfjScTg5ojvqr/StdKLGzfm2EvegZQPV3R7c9TH/SYao6N4a+
         9WpXfACIGBRheiQoRfuJBvD4TwwtlHxnLiV7hjAX2J8mR9vW7QdjOdnoVoTJpEuD66Pe
         /JI1XNpXhyXZmga3BDNQB7vhuj4BNBnv4vgtl8XVuYTEN4gnHATgeCEVJMtklcj/H0ab
         4qwHpK1idThI+nh0Usu9fTCkZFxA835HPggfOKY7B+PX643PF+tw0v4ksdU2Jp72wRJV
         l88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793538520; x=1794143320;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DN+73IopgojkHF5owDqrZcQJFph061u4C7fIX+4pVMM=;
        b=YAbnxtuhzJqI0GLMZF/Pt6iBxUTdwed/A/dGZ0oc7K2bjw3AO9HQlQUK33KMM1iFYa
         /KTOwKlTMsV7Y6jG/jBORyCIRnCURRStTU44ANGozJU5kGzD84pYC2Xljp/5UqybGsMO
         SmZ8tWZiToQ/xsartmwUN0lYtQkJXt0LiWaCWmqEraA+P1ZVHoqdIng6ffsOIZyCdCix
         /S3eyIB3Op9mPZ8zOr2yK59IRB9Au1QuDUDXiPbqeFQeJYfwJADooB89uymb0+hNgNIk
         00Oft+i791jiziUvoJlsj8nSm15MkkEBVtUavLJuOpltBgvyXv136jKBkDTTxH/d5+zD
         7fAw==
X-Forwarded-Encrypted: i=1; AKwUvBwaDdRLi0NsW48fs/y+PlEoV6pjbfcVvC54B/p4A2KK95f5alFIfjym/Um+9ObvbqIsMneWjq2AsGxpMcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mAzfhPSNd9acpGo9LXiyhhIsATobWYVqR4rDwbaKlUsL226wi
	WFGgXNjUw6Mq0ZHq+Pn4nT8pDId8boYycBU5Ia5EAgEfkDV9kv7xMxuq
X-Gm-Gg: AYBFou0PRkIFyTHGS0eJCchRK7QuKVR/hq5eQ2sPergbMmz7ttU6hF25OADov97MRia
	G90AKRhMBM1aWzwYAoUhq9QF+P2riiu6N45F6ZP5lFHT5elRF4aQvvCkPUEYE6JMi9SlFt5X7nw
	fvE4plDYb3lslmz6j02meAY16pYq7O/8bf8PiMmc+DmcWzCRwRF1czjkVokwya1u0+PG5ieh2yY
	6rWGnFB+rZVu7zQMhYQgGg4ULtmDWbtkZNesd/P4e8SmomH1Hf61OeyjrOfc7SJWO/DsVUd3P2E
	9ncDo+8KxItpARwcupRhBnogKW9wLHT4x/hs5rgI1YloaNYOxOs1Ldv00fxuVHIYOgjlJLNZTGw
	M/IZY8rfZUAUw3WjkXmTp9d3si73saH6e6sXdOCgbdeIDSeCNmRcYwxzGKruLSAv0ncJhikQbiB
	K6g3IgV7OUN2pKqAr/FtTJdcyWvgo7+TSi3hRmRwi91jPOvpfNibl+mT0wPbio4CvnY6JSGJwE9
	XRtSXo75swmOLs/Tt/fLzo5LoCpBciqhGOtI3VcupoPb3xdYBIpKp44LeYbMyorRqpAXlUGqMTI
	GFeeGVVde9k73sw/e//jcIOWOdbP69JpHxIEG+aBo34GRVaUg66ktEGbsW1Xd9nTH/w7JHxc8ls
	ER362GLYE3gd/2YjVwViNKKqMuw4=
X-Received: by 2002:a05:7301:da83:b0:366:83dd:46f3 with SMTP id 5a478bee46e88-36a423a1f05mr10839613eec.14.1793538519681;
        Sun, 01 Nov 2026 05:08:39 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm25939660eec.18.2026.11.01.05.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:08:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] hugetlbfs: report inode limits without a memory
 subpool
From: Aveline Noir <jm5905938@gmail.com>
Date: Sun, 01 Nov 2026 23:58:16 +1100
Message-Id: <179353789680.2.16953097023348053073.b4-reply@b4>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
In-Reply-To: <20261101122653.53982-1-dennylin0707@gmail.com>
References: <20261101122653.53982-1-dennylin0707@gmail.com>
X-Mailer: b4 0.16.0

Hi Hungyu,

On Sun, 01 Nov 2026 12:26:53 +0000 Hungyu Lin wrote:

> Report the inode counters when an inode limit is configured,
> independently of the memory subpool. Preserve the existing zero and -1
> results for unlimited inode counts.

Tested in an x86-64 QEMU/KVM guest and all checks passed.
Inode-only counts are fixed, and unlimited counts are unchanged.
Makes sense to me.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>
Tested-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
