Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260199;
	b=oMrifGxSWsDQe+h5klYl5WNDPVOEYmZRKE/v4AJpgAlXOqRh3bw+GXjXq2AOBT7MVtRI
	 NEVMaTOAuHp8R00hO7NZg6HXzJO+2rJGiV5J+a29CydLVWiaZd1/kLhlgx4x3wzUz6Y09
	 M4fxgqRJG0OMrcptWb58XaRvFf7JQyn2jGJD8OUmk1Xbll5ZVNhiPE9U95dtQbDlpyAHW
	 G4TC1Ah/a+3/6KlJMi6mAOvR96IUUVc3YOeUjD1IG2mk+O4w2vpFTRaAH30VKgfSQC5LZ
	 H0in5LlrQEQO9o2DnwGuj5Kz3rs476ZzMPZDKzMO4DVQ8tRE5Yau818dRdwf4sSnaQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0Kx5T2Zh6GBBFVRGRo+yPdOYmemlYMbdnEqHarr3OXY=;
	b=SGWDt6XBzTGw0Np9M/whCU+gW+8gAJg7euAYHNp9pke91tNDwwyk2qqy5rXymLKxIsiA
	 nMHESEv07f6E9hcAmt3RpGkFLbD0Yv1sg5Sa3/s9/+gXMtopC1mp3dv7ClTuzfEjDC+3x
	 eFZgb4DZFsb5zDk6CfJ2EtpD8I+UTTbf4h0j/iAAAMtOwUGWoi6zE4moCmcWOcb+gkIiB
	 rVQCpU9eb5Jxsu6lP7NYEVudsnoB8jBgIk2bNlRcYz2C4x3BO+PULkSbrJ2iqgw5Hx3+c
	 QdyYDObGYLkzHnnuS5Qbgpcsk69Qg1nSF7/WqQRmL+U+PoNlj1Aj9r9s8F0JoyZyBxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE8cC9v+;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C085606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C085606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE8cC9v+
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so2043289c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260198; x=1793864998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Kx5T2Zh6GBBFVRGRo+yPdOYmemlYMbdnEqHarr3OXY=;
        b=tE8cC9v+vwT/2Loi4Wz9xzCZ/GZBX/8g+egr8DRZjNynMG2QjspTrw14jfWHyvtWtB
         Qzo2kPj6EpVvC7wf26zBh2iN3aOWlXsn8FLdoyyOeh7r6qK1kH6QBz0BFmQy7BgkP7Am
         bmLvfhKy2lJKjOwm42w6k5LKBB3CKSHnqvdjV30I+cFmds6wk7MzK517GuH+XV1FDNwT
         gDX5tfpP2/rG+DcDXStCz5PcWho2PXzXBwFWbSN4995fw7a7ewLP7R+MAnFbxvWP8Wec
         vLeDqPPHRhX+qvRRxFHhLN8I5+dTfU5L4We1xf1gj41s1Rm7dhQ7KuBMvQH26gm/njkz
         arZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260198; x=1793864998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Kx5T2Zh6GBBFVRGRo+yPdOYmemlYMbdnEqHarr3OXY=;
        b=TPD3e3CrG0chq4YvCQmHloA57EHNFRDbeyvwnjgd7pVk1Y4Ytc1ybsC4rwEmzWELNg
         1UoKkYGENoTTgS0sJEBqmj19lRqwR0SAJQOvCUGINfqT5rqPwUkFoEu1jdFe8TIFoYgu
         kcp9TEzmzc09Iq9zZGRaGWbC3S+cagkHGNdK++NXVZdpxnYq6kqQ6P/5bK4PiUTlvSIS
         HBEtRlKRB9TWR9oTpY48E4GURdpVzX8wKfpaa7mmGy1NDzW9qhUGc4EydmhDrbLmkgZ1
         pnRUAg8b1mNZct8FDTYgwoTgJyLmi0T+TAuLTxNxRXz0lsfTk3eHT/yrojtHZ9iNvRJs
         wJJw==
X-Forwarded-Encrypted: i=1; AKwUvBxfeGCFWvwvYvwztIjvZBY7tNf9IA9ljBvz94H90tEQQSYR4rPHjbBwuy9wCKJkZuTqZoa/zwGR4aSRHss=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5PaMWDmdmElUuks1c2SOBxvuaddEk9CgrJQkpvbvy9DhaOC89
	oqWXJ7bTiWVI/OA0GrT7zJxA7P+LujaOBIJ3SYmdgfK9uhzDa9cyk4c5
X-Gm-Gg: AYBFou2joBet1yQTiRhCWfBa+xlMgXLodoFNfI6H+A4r/rYo7VADTSwUIPuU6j95Zt6
	fkZiz8PCVdaojlj4m6kzPhDOYuKoyHBHHimXMq/3JRB6F/Fu0NFXnxXEDEkMnruQ+sA+XYP+iYH
	6lQu/LHagMkCBeYc/rWs+hpEGxvVMnGhACg2eIQPgFPQzREz5YWSW1KE2HCEjST7/SYrY8M1HTO
	rc+KIQyXKkW5d3khpgnWdk61UkdtFWA7By6IT50vGyS+OkAlgR3dYQT5rsEqQjxmNCjE0YQRWoH
	EqEzoCSMeSMjQWkCWa3X4ICpfwSrKiWQr1/j4zZigrM6fuTtTtfrqfz+JKSm5vbgAxrfxaC/9ke
	CRGPPsDZj9xMezZ86S95bQLsbGgau7e7TQjS4TuDrLXSzG1wd2ujBi1Cm6EROTsbxKtr6iILWzP
	IejgnU3roW1Oqf7k7grdH4EfgTyTepJdMpNiwPgRFh8Vx7d23HKaW076szR/LEjv+HkwByyb/uJ
	yoT5R0uOxilJ6dDbTC5j+gkZfoadCsQmNNT+ldpvMq+IsEUueG+sCq9LvNivW2HI1MirxFFpPlu
	VE1CfAKOgyp2K2wsHSpXgg+xujAEeVX2pALvfNTNeUG21DXolNPjpo4aF6szGzuhuBdmpbBJNQF
	kBaa+gC+NOZzmMEe8fXC1A9ZCUcLmcTabaOKyj7tgVZ+ZgUkA9f1m/8zmKqmynbs/eoO0Y+vLIg
	==
X-Received: by 2002:a05:701b:2304:b0:1a8:b566:80c2 with SMTP id a92af1059eb24-1a8b5668212mr3515852c88.17.1793260198198;
        Thu, 29 Oct 2026 00:49:58 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d4887easm12843583c88.9.2026.10.29.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:49:57 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Jacob Keller <jacob.e.keller@intel.com>,
	Jiri Pirko <jiri@resnulli.us>
Cc: netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	XingWang Xiang <v3rdant.xiang@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] genetlink: Reject joining multicast groups no family owns
Date: Thu, 29 Oct 2026 07:49:51 +0000
Message-Id: <20261029074951.3413609-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261029062214.3407223-1-anilkaushikwireless@gmail.com>
References: <20261029062214.3407223-1-anilkaushikwireless@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding Jacob and Jiri, I missed them on Cc.

On Thu, Oct 29, 2026, Anil Kaushik wrote:
> genl_bind() checks the GENL_MCAST_CAP_* flags of a group only when a
> family owns it. For a group ID that no family owns, it returns 0, so any
> user can join it.
