Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813091;
	b=l+eT+e3ozLD9Ac8WaLo/X/S5501yJpf08WP1tX/+BKn3xchBSsH/legOOWt9Unzw+Fxq
	 2ew1jfKh+j2VW3WxHyBF1RuqdExL5j3ihDgQ/RI67K3lA5q6IZ6mEWkm51YmS5DVfYGUM
	 3Ie2p5GAlRpq+2scsA9hMG9uNZplx2a4QaNAhnRza53pQRrVZx+RJ1GaJh1ncco2YlzW9
	 Mu8qXD/ob0INvaxYVKy+vtArl4hjSenWJWxjz7nGBCjBN4o2VS3q4MMCV5WzR0oG7Tk15
	 LE/VGTvAa6O3uVKztpSKJUE9QtVM0OZmyZHCZdC9uIoOcrKshL6GM8NyVh5gPHk4Gzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9GhfeK0P2s40S/hh46Y07C92GF3aVYPq8kDhBl4KyJw=;
	b=dWEcu3zAMcnNM367+NMhBDGMMy1hmSfvLC/WFvjLIiDFAea+Ir+oSp1A4M7lkLDfE605
	 Ey4Zy/a6FcLRM6LK1tPf3nVEIPmQzbDTCSZgt4evvPFacj5u9yIPpDTWpRniVU3d60f5L
	 L+acPOnKdInhPtQh3L2fNvSepFB56KFfNlSlLGja1KyYXJ+RrGFP3yVMdXJjd7KzwHHvR
	 BeoLUbJpgHNP8ftk09rFwA8RWtWEqS2bTDYa5bzfsSVr+UruXcOFfxqTWzRPEZfayqZ3V
	 lGV01zM2lQ8F62cSd3gJymGG37eOAsi3Jv/iH49ITLnWvhunEmtYZ33hEM9smSsccZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7821606D813
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7821606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so655296f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793813089; x=1794417889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GhfeK0P2s40S/hh46Y07C92GF3aVYPq8kDhBl4KyJw=;
        b=PEuUv/AnzFxAU8Lz6CU2kYUqdC0vxnR9PRHZBqtOiE3NWl7h0/NmMOpy/x2Rb+3y2+
         TF+kpn2/fq2tVD1krsyNQDaBTypuYI9131R5uhmZOLawQrEdBn9oGBWIB0kTw5OnY/4c
         WfYPKegdto4Mrd3RzlupmSWo54LCweuN7uvvAlyWZbIPxIcknQI14qWR5zJU1MtuZXKW
         b0AaBirsXBIAcJtexxPJyFdXzkPANHffqAiMqeUzc8UVddUj5ubiQESzGHOWjrrmYXMa
         nbfwapSlKE1Cfo2VxHy5VnLHLwNTD2szzgPZwz13plng60hXYKv/Diyjf5TiEwIzZpeH
         5NNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793813089; x=1794417889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9GhfeK0P2s40S/hh46Y07C92GF3aVYPq8kDhBl4KyJw=;
        b=mf/Ntn8ynSwHkc7Kr9gL+w62cyT44SIyWfaS/FRSd6bkJdUVJkCnjB9kLlgtI443+f
         885q4NNeyCpr7HZVjwSYOC3kG9RDy/y7hqQ84Z8y8tOEwMqlUllmf9Crd9mmsbo6q01X
         dcIRmdlMSB+AjxoRQq1TzobFtgBWK1gWF/Ec7ZpwKFcwUmzG3xn3z4vydn0E1FmOjTRa
         ibdBNbhF0/7b2bXYs413SOkswE72bUyjHJ8EszUa+sPH8OfxdLZl38FspxWB1XIjLqYl
         s3upiEb1QkRmaekXxJgS2+PQGuACFnaflt/YpLH5L0YA+RGskiNIoiEUeYSoz8J+qh4/
         FZeQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8w9p92ZWBvbLE8VN+E5HaYM/46/v9VDxZ0+rKiUF6hMbHrtRuzW2ElY+NGyHRcMohMe0oJczANMF4bS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cn3AaYTi1xsCx6AbHBoMq7qkozeXaH7L5XrGMn0IaIt4kEigq
	v8Q4enzO+PHbk/C6vkd1/r+nXlIiEx7SerBfQHPAceruaLRpa8XskRok
X-Gm-Gg: AYBFou1qqt4o8J0/60cCbfd+37ZHpGzXWxaiIH5SuyeMXU0Kg+1p1gRnvD3gg3HBHxD
	Nrz/o7eTOahAPdPo+sIHq7ZqFl+iE0XxOYqTct1gfEyfyf27YkEDRWiG7lnY3rpM6ySUUwPT4D2
	UMZAPw7mHHleVICmnLvlZtkr8FJxFfw5dwSq+/D7r94PneFJua2cXJqqs/hU41WknpazWc2tmQJ
	Q32ayfchUjw029eXGISooDLLUJeCK+fGEJkRxjLSoKb5aavpuJkJDSdZiUBENg00Y6s9D1swgcj
	q/kdKEDNOiQrraFolfn+wjq4j1L8r+DAkzUijdRB/8PSdZYByyd0YKXOMAQ/nwIlPtyK35EvNRI
	lilf0c8cIKfcgpydbdDwnv4Vb/BXo9Nl595DcRtRSKs2Ld8/xbTpAvwwYb2C89aXCxoSpT39IYO
	r+RrkbSUE1lbCv4tZuSVast/zC0mIZs1UqT9SZN4l1fVS9hRWQGopprxTusmm7FAn9M5ykwLffs
	hZflysByD5JBgYOUIHm+kB2b5Hg6BPweX0ApfLkzHSu9+yStV5xxVka+bDt+/SB1h+gBZnOThKw
	ufG8ioGzya2Ao6cdp5rps8Or8YaSxvkPlHLb1o4iHLi6jH08r8n0bg5htKvoaNN33jRQEg120+1
	7f7ZOttymlvjd+cx3FWP0g1kkPFj0RowKQJB/1jE+OwDlW5ZLXWZsbRwzc5Bx1Id4tf4=
X-Received: by 2002:a05:6000:4312:b0:48d:f36e:fbcb with SMTP id ffacd0b85a97d-48e6e2eb205mr40183789f8f.14.1793813089158;
        Wed, 04 Nov 2026 09:24:49 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20935sm4836773f8f.54.2026.11.04.09.24.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 09:24:48 -0800 (PST)
From: Fred Griffoul <griffoul@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Mushahid Hussain <hmushi@amazon.co.uk>,
	nh-open-source@amazon.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: Add helpers to allocate memslot metadata
Date: Wed,  4 Nov 2026 17:24:48 +0000
Message-ID: <20261104172448.66264-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aus6G5VqWJv1gq7U@google.com>
References: <aus6G5VqWJv1gq7U@google.com>
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

On Wed, Nov 04, 2026, Sean Christopherson wrote:
> Split this into two patches: patch 1 to add the helpers, patch 2 to add the logic
> to pivot on INT_MAX
>
> As is, the shortlog is comically misleading.  Pretty much anyone is going to read
> this and assume it's just refactoring existing code.

Thanks for the review, Sean. I'll split it as you suggest and send a v2
shortly.

Fred
