Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512525;
	b=rApSFyPwX/UjNafoAHP+G6UOJGWDCjXMwLOxGpJCylesB1+j7ym/zoF3KauH2BA+qGXU
	 phV3r8viVL9gTJiV109H2E6as8P3fIUurbW1rIiGC7gtXNTUuxpFhWxibre06f/BaWTi9
	 8V4w8phHHjo30urjlJx1SM6LWPVjILDwd/iesYj2dQcPn2o+adc756oyyPbuA/dN9h60t
	 Q+6c4C9GKj7K6jaGeG2u1yngepsbyq33sT1Q7MB16/SlSeIfbWvRToz7cZvmP580e1utX
	 PBkg8B6EzoWaFMn4FXccen0P/OnpI1Cxz8YORVssOTcXwtC7E3uyhwomusS3aqmiIow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512525;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=JZGvSJ/T2lFQAZNU+lUoUCnDcDPrtpGrw0LMffwgz3o=;
	b=MI3bY/HynyaASkC9lWmrzazO433SASpJd357JwWlGRyeo+uouq5l1BTAaVMKvS85dj2p
	 a+VsZ5ibWufcB4N640tCcl3326/8wK4GVylLWC4BBSGCTA20iJbL+Ss2e5KywR8H8OwdC
	 EQ4Qv/VGUQUo7PPrysj4BzN0bkKdu/eLDmCReNBWiox83njiGZKtQZhq+kenovg3PNupn
	 p6VFZY82LhKMc4V81UElpE20XiHzMyQ8Oo1P1MCEeqIlseBxZt9q9Kf09VKBy9VVJnz5b
	 Ce+3y9YoBSUiLZ5z7OUVG1Fq1V6C+PHH7BGK3G/b20vSTlhrXVGBw+JAGMPaCNhnDSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VwWYW3JI;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF4E606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF4E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VwWYW3JI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792512523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JZGvSJ/T2lFQAZNU+lUoUCnDcDPrtpGrw0LMffwgz3o=;
	b=VwWYW3JIFF2TGB4sO0AN5b4BADapfxMRyLBp9qOz3aeo3Yd5A3GnYwCATs89PCYcwa+pmJ
	/R9yMf9GcG5at1FIe9CvM2TmPcxnQtBEsMjlqg7up+qzY1JuI/Tjn0kjeT+2RPD5I5IYHK
	hnIaDkQUh7Bupp4cuIG1B3yWRUR52nU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-PrNzLbbOMWmkiqW3IDyx1g-1; Tue,
 20 Oct 2026 16:08:40 +0000
X-MC-Unique: PrNzLbbOMWmkiqW3IDyx1g-1
X-Mimecast-MFC-AGG-ID: PrNzLbbOMWmkiqW3IDyx1g_1792512517
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB3F7195E915;
	Tue, 20 Oct 2026 16:08:36 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DF6651800495;
	Tue, 20 Oct 2026 16:08:32 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: julius@bairaktaris.de
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	baochen.qiang@oss.qualcomm.com,
	hujy652@gmail.com,
	jeff.johnson@oss.qualcomm.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com
Subject: Re: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
Date: Tue, 20 Oct 2026 18:08:30 +0200
Message-ID: <20261020160831.2133912-1-jtornosm@redhat.com>
In-Reply-To: <20261018131930.1116724-1-julius@bairaktaris.de>
References: <20261018131930.1116724-1-julius@bairaktaris.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hi Julius,

Thanks for the review and the Tested-by.

> One thing on patch 3, from reading the code:
>
>> +             if (num_free == 0) {
>> +                     spin_unlock_bh(&tx_ring->wake_tx_lock);
>> +                     break;
>> +             }
>
> When this breaks, the frames stay in the txq and nothing restarts it
> until mac80211 queues the next frame for that txq. A sender waiting for
> ACKs then stalls until its retransmit timeout. With AQL I measured this
> in v4: one download in three stalled, max RTT 347 ms. A restart from
> ath11k_dp_tx_completion_handler() fixes it.

Good point. The break when the ring is full is intentional, it keeps
the frames safe in the txq instead of the current -ENOMEM drop. Your
TX completion restart (patch 6) would make the recovery from that
stall faster, which is a nice improvement on top. Another reason for
both series to land.

Since we agree, I am going to split ath11k and ath12k into separate
series to try to unblock both.

Thanks

Best regards
José Ignacio

