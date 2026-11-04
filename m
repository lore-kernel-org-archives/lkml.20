Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834147;
	b=AwlnOS1Q1lV0MQe8mAaUdfqKZLrh0n43LMH+PUbXoH8sWpK3DkLgXIA1daNF016kuc/D
	 Q2islL+xV2ArpP6o2RN0b5lNjOsJRJuts5YapZoNMKW/WVhwFHTel+rpfkTKLKy92rJ7M
	 WXVRULg7asDvDxG9+JD2I/9quiXtajsiHUQymqbrmYwBJbVvqCrKkXy0Wiv0Cf+etz6fY
	 P9SBSBQgAnjUJIX6dGudCEXf9XarlicHDBpwwzN3DcO3rpLj5wlt7do8dNC2lZrIzBOf3
	 lTCQ3Yd99Nzb8xCYHlkpHno8kJBG3q5ZvxsTaiwA2DxVmnq7p7veiyIFZEFQgyejNkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Jw1A1CrCQXufCGBVmtCdk6Ioy3GBOtyXllOzk3wnD2c=;
	b=nphOk2KjZ5o10jcFNJoj5RGK2QEzntI+3MaDeQtuKF6I3pRxDmD6hiiitwHlzpFMef3s
	 95ogAf65FumDamoN1IgvFpKFPP/xtwZnTKPapcOdhfhMXNbBeK+WgrPyMlbYLdXZtLVdf
	 LggMV3BAPPLDi9dGrSaJVC8jjpFWDDoPiaQj0sbAr1yBJ78vp2zjOHBS9feDtffAQvxK7
	 M7Q2Bqd2OTWsTUcwvA4JPvO5HadC75b0aZ7bImQXX2kb0FjNl6fixiiDmT4CxU715EA3H
	 oAMaqsIkMcSHJmTZ313YZTMX3c7GG/8qBrD23vFElYW33oF4DbsJhk8RfsTz9QkdKlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB90606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB90606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso13044465e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793834140; x=1794438940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jw1A1CrCQXufCGBVmtCdk6Ioy3GBOtyXllOzk3wnD2c=;
        b=axhdwTpYq+UaGXjhC77ce+Tg4LB7x8gBDFrWSoDcxdhuvO5tPQtPCtz9GvNylrSkux
         innhVqS5u+behTS/qXCGj9Ags0kOlTEczMI0WuGXOqk5wPX3IolkzZFfnYe90FxxR/lg
         iiWkFcVh1EaSwZX4TlasKlhH8+oF1+CbMSlrD8GiJA/x8Qxjpw9u45Y2Zcrab+LjpwOj
         aYMJCRLY3srOmcAWyeVa3xU5OJs5Vjp2TCDu9zXA6yGWbRUUnmZ+Iw3OeniD/DPGwpxb
         PLf2pLJIpnvrQd/sULK1CxhhBb7FigAFvgflcaZDFQ89Ti+/EqMK/zk0qPMEaC9HiBRm
         hpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834140; x=1794438940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jw1A1CrCQXufCGBVmtCdk6Ioy3GBOtyXllOzk3wnD2c=;
        b=NUH00aC+NdaR4EFb0Rjp4INeY9yBgu5bHR9u0L9CMHvmc02Stzfcv0rS7UcRTzK3El
         5RFWnPJA+oCJh0tO9JI3KrlBTaLu82TH2ccYvv10feGKM5+4WFJ+3Tiq0MC+QDqNr7h4
         s+ScV6TTmri3k0gi8ivBpKs9dEQj6c1VRMgCNymXG/JLdCXi56WsgkDXEk2/S+K1ycyi
         8MUSoEy/ySCHeZqkxWn4sPpKRVWJcL6EIs6dDkTeTTmnNoIlY+XP8p0mV2DquRxvZoTI
         TXR3dmFqjD5g309wmZ3iipYsQMuPK/cGC1jdTtOahY30ch4B50pTa9g+0CVw4DPgnNj0
         BxMw==
X-Forwarded-Encrypted: i=1; AKwUvByIIy0qQoVd7a0EYfdkeuqaYr3hWjUlwkzBgwzq/HW4lXfeRLpHE9Uc1QigtzPI+K8o5rMo0HzH8+vyRgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q4XP5hsbvdJvzvYQImDAGLjpwxxQ5MTUaxpXlPvcST9SVK+xo
	+4HTuQLKiz6vevubbxkUpjZkuUQuRGVz5/BpL2O5NGxFuXJ8rSj1yaoN
X-Gm-Gg: AYBFou1QOCyj44M8whNjHOMIft0lG5Siu9pol1ZVm1QpQvEoD7MdsaQHlSFq6us223q
	bHeWpEGAD8i6d+MCoxwYXd7O9rcSFjYHPxpc6D0g8mfhIFPYqBjqoHiFYvQmWj6yKrMnrNd6qOQ
	SUX8x8DrBGSLk6Owlu4TJxFfEbIsjhvctzzdv+bRKAuRD/pFGjDZLo+mpmu8Duj0lbpaRviJUjI
	rbl7q1OZt59RhFsUCbSgO7Yc13eMSrIFGuFd0eCUJwRgtcUI6CfXLwqMSsllPBc+pnykxzxqfPv
	0C6ZNQjT5nVF6fxovC4DmgDJeO6aAcLtSqBCDwdTYLWrz9UULqAxZ3t3fQSU6Q1eDDgy37QGwI6
	7VXmdIK2eQgsJpLPH/kahCI+cvdOqxZ01E4tEOMjaxm9yycKpR8BzTRYBlxU6M67MHHdZsHvgcJ
	PowxpAzIRsjaMJ0C+2te3IdBJYHR6xL2nwH97trHHJKtBdGP3rG2Ow9suZuzCNaRYDnrTqVZUBF
	0NXf9quE2QsTcrzR7ezcN4GG2po6OUdUoR+KU3m5A8wCsRWbnKTxPvOU9WtBFsTijqWz1OdCEL6
	Fvb2spjjZF64inSOU4GoPeY=
X-Received: by 2002:a05:600c:3f0a:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4b3c3545341mr83410955e9.20.1793834140542;
        Wed, 04 Nov 2026 15:15:40 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20567sm6769827f8f.51.2026.11.04.15.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:15:40 -0800 (PST)
Message-ID: <ad6e93c7-203e-470f-804b-fbf7ac9890f2@gmail.com>
Date: Thu, 5 Nov 2026 00:15:38 +0100
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
Subject: Re: [PATCH v5 4/4] selftests/mm: test fork of PMD-mapped shmem THPs
To: Konstantin Khorenko <khorenko@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Peter Xu <peterx@redhat.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
 =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
References: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-0-c56d0d26f970@virtuozzo.com>
 <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-4-c56d0d26f970@virtuozzo.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-4-c56d0d26f970@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 9:40 PM, Konstantin Khorenko wrote:
> +	pmdsize = read_pmd_pagesize();

read_pmd_pagesize() is pmd_psize() in mm-new since 5d123bb07b18
("kselftest: mm: rename read_pmd_pagesize() to pmd_psize()"), so this
won't build there, will it?

-- 
cheers,
jose a. p-a
