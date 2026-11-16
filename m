Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815214;
	b=ULKVGpopeLFe+c6Fs97THAJPXCi3h60c7UFRXi+JLHMVnegUlU8xxjkVMW1szXn3sWFt
	 VEG7j/83HLxm801lwy6zWs78WAnJPB9NOpTwgyWX5DmoT9k9zUApdfNFUWitb9ceAX8xi
	 A5w99RlHiba1ADM1O8pSAVtMi3JS7z7yu5rxPRhRG37Llis83HnBdUXe15dzByDi6IgBn
	 YDiLDAeluYp7QS9Mc3vPs1h/KlMFoRFCLSFwSy5qZaoMspeS4DyFba+BCMh3f0B+P1HwD
	 XkE9fmIuuxH3W3KHQ6hClkOxzL7CfDqnPDG4u2es/Cq3CTk3wqaQ6ULm2bWo8omwyiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vlmmf3Yw+/83b82AdIUcfUJeqmaW+6kFUL2ngX8JzfM=;
	b=iwb9jWSQbTUULms/jOVOar+IqSi2qL8rAVVQaM2aZShXtTnHXI2x1Nc5bPvIsVapfa9e
	 bsKCpTUW7ToiGTBLqp3EUZ+RmFRJJakoagfPMvq+Y5cgBpIuCLSEjuCeCVKvdI2sAP5NQ
	 cJpCKYX0lQyTOLGN+zs+Eofmqk3EhHxnpcq9/vDsDW4PKvBA2INarW8/NTs9GBeap3kiM
	 /Dog3FS4WSJESm/k230Em2wWTa0pmA9u6RSZb8KtQZmejxeEBV2kfTLbRBNaQ4tXq5hny
	 TBPAsNYNL0kPUZ5L0V+XpRzwPc0ALJzqjeJHGHgl+AwG59BpB5WrKhhnn/RX1ynspXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHYZUuPN;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F105606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F105606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHYZUuPN
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ed2bfe3252so10059435ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815213; x=1795420013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vlmmf3Yw+/83b82AdIUcfUJeqmaW+6kFUL2ngX8JzfM=;
        b=bHYZUuPN9xML3Yrn+cCasQ29AbiNF4JPUbEf+WiN9vI9QhAUir1nYMBF44t8yngNJX
         FCyfosmDGvuolOH7vpwB02QbVRIDtV8eXdj4sQb9zBxzLFrglwpbsjpUBFOUfujIInYC
         2xiEwEWtjRwHyNkqzu2bsC0rVKyrQjGGvRBElOFJP4AGuXrvASxD3+4UB2q8zKw/aFWi
         xlNqwCCKZOmQ7ZuOeljW8RZt0eObB0UnJIgk39heff/DzgMm4D5iLjuZ5wrdO/krjykN
         ru/ADmOFKKC0oshz9HsbPDQj33Pub0FnNVdtQJ3S8hcBj1u9lGzEoX6L4YpPG9xTOIkF
         yP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815213; x=1795420013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vlmmf3Yw+/83b82AdIUcfUJeqmaW+6kFUL2ngX8JzfM=;
        b=iEwZlsEHh7YVz7vof79djLUITtqQx2RTrPqUyxsx1QoHJYn3wZkS1xXA/hkPKaQIzf
         WnTFI39JA/L9DimnPRVtWs+vkhAGcG8Od7aY+AzaU2NWfCIFyd15oCB6XeW5FozO+CL/
         KrE1AstTPnq7Q9/SPg9e6NYI0LutFbmNjh6kFThdPF6DE8uogFkcYix+j/iJePHYLdpa
         YVqtqjtWi9Dkh5QdRjIjmN84h0D1oag0wYp+hovo9SgJOgMbAb3XiGaD/1yQmqJmEqMq
         jnQYwpHnADQf7nm1tfftzpfJsaoFJ1u/rvvzOEdT/k/vLJ53uletbceY8dmbgrNW2IbS
         h8Bg==
X-Forwarded-Encrypted: i=1; AL+hErHfQYGMVCNRTGe20ObpYCXPDuJFS2c5+ioMFykuLB2/hCfKW2Ja8YXd8Ug8NhekHflP09yWi2hS3qiQn6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wVrnGvTlY979lDVTVcgnZIq5Nd3ZG4bvI37fk93tYaBwcLpxS
	CRGISr9EGOmy/kTLE8WqnH2989pUGgSRSyNg23AQJtiUVBcLAKc+bto2
X-Gm-Gg: AZFdTZcGNwoqpLbS5z15eOAlZPWia8kMFC1dGuY8CeV/Jjc/jEpQND3YGtFf5vt/lGq
	hTEKRlGVvYKUjjl2mHnDuP7rJUP9Y6p6/r8mq2kkpW+iTOshPtifpc2TyM3tWxfmQdhK1Qz+AKf
	laJJ6jol92FkQA055C3ulhZ7CGl/2tD9BuRyMmyJd2QorBTLewZF9BeIzZcPUmhWM6SOJpl28Jq
	8pIEaQ1Yn8GvgRQ3Emo8/bdr0D1NHAlkGUS36ojumMHLvUHyTuni7aIsxNrsqVRlbHsbm7/vFBB
	f3gGi+4Hs9Bggl8P7B5gPftL6i3HUVqVC+gZJhjzaFPkQhjPjj67ESVpMy59hK3xOAa3me65znr
	UwpjFH53vCO7+Jahn/vR92iVQdntC3RW68WVMHfHWJPafnt4SL+2RNly1bSI6NcJ5WVG6KVbpK+
	tSjTPzTrI3ii2gmgwu52+2PV3J7Z6RsP0GAkdwjBOekDwmIxs2yrLNqO/0y5Gm2XCbuE43NywDL
	YOC45cXDQIonbZm6QvgtCSDbPS8zLwrHCnr9PwGBPL5izQIbAZA8gSwFRYPyr9aCOKD8drb4k+Y
	TZz+lNX/K017YiZDJQ7UqC4Vk8LoSMUR9/hFa4q/ssnNiOdaNaoQBWaQwX6Dz97cr8hEXaerEWF
	p
X-Received: by 2002:a17:903:11c3:b0:2e5:54b9:6b37 with SMTP id d9443c01a7336-2ee0de56f82mr93360645ad.28.1794815213447;
        Sun, 15 Nov 2026 23:46:53 -0800 (PST)
Received: from csl-conti-dell7859.ntu.edu.sg ([155.69.199.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75c98dsm34379565ad.17.2026.11.15.23.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:46:53 -0800 (PST)
From: Kaixuan Li <kaixuanli0131@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Jan Kara <jack@suse.cz>,
	Andreas Dilger <adilger@dilger.ca>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ext4: don't read past the UAPI struct in GROUP_ADD
Date: Mon, 16 Nov 2026 15:46:41 +0800
Message-Id: <20261116074641.2498433-1-kaixuanli0131@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ys252ecwpg5kqvwjpfehelyatwapddajbtnjsjllttwm32dhgz@frw2pzzlvvoy>
References: <20261019131655.2583227-1-kaixuanli0131@gmail.com> <ys252ecwpg5kqvwjpfehelyatwapddajbtnjsjllttwm32dhgz@frw2pzzlvvoy>
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

Hi Ted,

Gentle ping on v3. Jan reviewed it on Oct 19:

Reviewed-by: Jan Kara <jack@suse.cz>

It still applies cleanly to v7.4-rc3. Would you take it through the
ext4 tree, or should I resend it with the tag folded in?

Thanks,
Kaixuan
