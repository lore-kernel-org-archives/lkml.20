Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716290;
	b=uZgH3eZeNaCj9ZK7IiVVZELoWterXEFHWf0Ke/CVFNPunGgc73RN7pWsGrBJAG+RrCLB
	 hFTrPT1ENgeitPz42A/D7RQNwmM6mfP0G42IkpFr/ZS1IH9w+wvQASXu7Mm9fYP1srz+d
	 2HBrnzRa6V3Zz8EXbRa+nDw23JA+SMllATsVqs5YwoPmdqfZ8TLxoOK+vJePiK8n8XC3G
	 QQo9Hzim5vZb2N4SAnnuH7+lJJeh5mssz57TT8w6PSiQ5d7H8nAMB1kcGfSy+bjQLTDs4
	 Aye6WTeM5NwLK46apKt/8Ee/pkd4nJxR8lcYvDMVwWwA6dvMfLUAycxU75FnQD/JCmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=lQP5UfoJGZ61K5R3SQuKiGS3++XV/5Fqa+MZBDFEMdI=;
	b=C+XXCE02hbU55QOEP+4XqVH4hoQFG57VnMgs+ENU2lF+0xu67RzDFfsKFG6iTk1cBkoK
	 mUBt+xkLwlltYm+znRWvo5GSucUydwx6dI5U/ROpF5X60+wJUyN5jtYtxYgop9K9GGI3J
	 AFxLlq+T8tNiuzaCDDYZ17lBN4DcWfAnQgWJ+MYGxGKhew46NnMQUIpUdVm1YDzmq9hWx
	 l1I9aU29VwasRKavoEHv8dfv1FBMcC0EgN0FeOO2N657yCWEW+NUMrJ/KBiySYvIxFgE0
	 rQHpx30fAAe2dVOYjIHeZsUQw7H/ZgtmWyoQJg82RzF4HHsTIO9fTXKnECqAnCpWdrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="gKjJ/6Sv";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4792E6083637
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4792E6083637
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gKjJ/6Sv
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so5345412c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716289; x=1794321089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQP5UfoJGZ61K5R3SQuKiGS3++XV/5Fqa+MZBDFEMdI=;
        b=gKjJ/6SvSISn5g6EFsgPui5YEYC/MbDN05MclZGEWTEgK+qxGLT2Pqzke2uXQS6c9U
         YfaHxiTLnY7Mm2g2eXYxsq+GmguraXytboIiKKpG2bDndyvwy/TGithPIDvxJSJG+G/g
         qGR9nIuGQxyGmxV6pT5DM0z8EndE4zDPoxsPKNQHUevSm/NmDC5FAzBIxehXWW1MICJP
         VkPwz9qSMV5dbjL6cWPjntuBAi8pRY0umW8vztqtlmNm6yxxkzOEyA05bn6l58XWzSmF
         ZHEi49EDPDY2thdsvCrCtfCf+SQshoj90f+9nAGDyx1BidsELgEhui/ume8n37Ga9duU
         H+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716289; x=1794321089;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQP5UfoJGZ61K5R3SQuKiGS3++XV/5Fqa+MZBDFEMdI=;
        b=E15GaoAEcMCdwYViMduxR9lbFZN5kT1O8GVOepY5KyujbQcgIbS6YTS8jN3GZ9tHLi
         tqHrfFGliFfEkSID6N7xtHYISvOnAfhji/svom3B2VohywOB8IuD30n4PIUjbtVPZeKr
         zX8aD/UVyrWxBdynQH9IRXXg3xbL/tfbj4RZj366o/4190a4028TVcMrSb8LUorxgZZG
         0vmW5ZAXgdYw6h4OZxqAHc/RN5JYbzHTc3gYabXZ4MG5Glfc4HmGzW0nuvMK+JVO15N3
         koAEOj8RoyEIQwvUPbcuHh1+FSdjsE3J7CwLVL39MpqwXDyZkwnu7Yc8e4W4RjM0ClFP
         oMAg==
X-Forwarded-Encrypted: i=1; AKwUvByPBor06IopEPmv7Q1BRuWoBjdMH3PF/nlnsTW5li3DI0JI8YST3YMEklri8OJsKacA77u6daAxSMuHdvg=@vger.kernel.org
X-Gm-Message-State: APuU4Z99Pvq17JPBTwieEhWRUszVReRwzDsRFAOzDfoOayY8xT5OySXo
	7nWEyiwKZfwSbIFt8kgAjTT9J6ba9BREWF0eM4HCfq6jO82CWOILNTgYloY07Ph2ozQ=
X-Gm-Gg: AYBFou2h4IZhuaJdOgwZf6obn8XGVDKoxLO04ziGIGqublTASUd/lXhN/vuBWPErOcg
	KzG4M6Jq3HNzGjU6qRZwwE7raekEVtzaStlBcHVeav809en0QNcQ6jwvfw+FGg2Y4eNPnP6p+oP
	iYBuHPfdUrIQ97zPu6vCzsRU17ceArgYP+/EQFoHW67xOKk2Mz+2LJfVKC7IzXUKZYPDR/pPiA4
	1UL6sJw3FIEo4JKrtUzvVkUxX2T7sCSg93+sp/47z6lv62HJY24fUkl9WJhOaOcFk2bnOhV8wF6
	8EkFkfCTQzKHF5YJ3ygaw2VrXhxkHnCAPu0LG1/CJWKuYDr6UyC44iSxXByA+H1zDFeLOaTNJEw
	C6XJ6+4NSO6qv2CZPmG1PeLgq1ADIkCcg+c0GZvT8X6DeNFjlkLKoww60EUFdXYIvVLBvXGZsAS
	ESw/DQUw1uX4FdxADk5tFylYlDoOen6zOPEbY5/IiPQZcyM2N5tSDd1UVKAqytzkjw5x+iT58WT
	7alu8ey71f8F1rL2SwhNSzfBukFELm61uKzteTQ7IVSd55o0GpnWxHDSjL+g3LN1zuHnpQNNMJK
	szBkw0ucK1+27FN6Gc2yWBa93/ocPuPWfKmOnexMjOiBXj8CI4TfBw2SwLLOgEUCyS5jBgiUOdZ
	rTZA1ZYYEgaER
X-Received: by 2002:a05:7023:d0b:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1ac5de53bbdmr21036321c88.41.1793716289438;
        Tue, 03 Nov 2026 06:31:29 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:28 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, 
 Krystian Kaniewski <krystianmkaniewski@gmail.com>
Cc: Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>, 
 Ming Lei <ming.lei@redhat.com>, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 syzbot@lists.linux.dev, 
 syzbot+e90526cab23b9efcd03c@syzkaller.appspotmail.com
In-Reply-To: <20261014170538.1089448-1-krystianmkaniewski@gmail.com>
References: <20261014170538.1089448-1-krystianmkaniewski@gmail.com>
Subject: Re: [PATCH v2] blk-mq: fix out-of-bounds read in blk_mq_free_rqs
Message-Id: <179371628848.3691261.276757911523604089.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:28 -0700
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
X-Mailer: b4 0.15.2


On Wed, 14 Oct 2026 19:05:36 +0200, Krystian Kaniewski wrote:
> A KASAN slab-out-of-bounds read can occur in blk_mq_free_rqs() when there
> is a mismatch between the number of hardware queues allocated for the IO
> scheduler (et->nr_hw_queues) and the number of hardware queues in the block
> tag set (set->nr_hw_queues).
> 
> This mismatch can happen if blk_mq_update_nr_hw_queues() fails halfway
> through (e.g., due to memory pressure during
> blk_mq_prealloc_tag_set_tags()). In this error path, the elevator is
> restored with a larger number of hardware queues than the block tag set
> actually has.
> 
> [...]

Applied, thanks!

[1/1] blk-mq: fix out-of-bounds read in blk_mq_free_rqs
      commit: 894e4e6084924cfd590968d45fad20908e02ddae

Best regards,
-- 
Jens Axboe



