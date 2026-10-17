Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6644B39A060
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222826; cv=none; b=Hoe9wDHnFF00lJXqltLRcGwJzd60iaCt+7Sa+/DMZFkFH2bb0bLU3H1t6eOTqOyN9rgA8hqa8R27X2C2CmIAvszJyI3EjKTN3t4cgZF8k/9na+e4ElkU2u1c+lmC74YUAN/3fRK+t1IEgZAIhuSe4/efEWo1a5Ia5W8T5NfaPEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222826; c=relaxed/simple;
	bh=32ROnbLRGK5yQqWv4zvyzIZU4X+Kno5K7VF1XhhIYHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dzCpNqsQLpz8HqdYUAOQFVW1ssBK0v8yiMArzB8GUmeo5zvicjZ7VIwu7vTu+ImRRX9e86wXxro0eQ5O84w01TGRuqf+1u76iFQAD3S64RhryRFFO3/oPC9PJlzS8crR2lArLe/aJ+nbCFSi1UNu8Igfu5MoZ86QiEYnz17MJIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ccTBmje1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ccTBmje1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792222823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32ROnbLRGK5yQqWv4zvyzIZU4X+Kno5K7VF1XhhIYHQ=;
	b=ccTBmje1lDGXxOKWMwuV0VAjuRG7TkUxOYu2gL2X4XbkfocSfAVQ+Ce1VGOOgcnl5sShkF
	pCMk7lMNpgX/wA41Y59KABa4snp9Y0O2Lz6w5MPMZ2Tuj06ltDPFSAa1lgyocOCAjh2e9J
	qTuGKDsZyP+wphDdwGWiD+ratZL6nxU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-n-lOljHTMkm4dNjJEocrPQ-1; Sat,
 17 Oct 2026 07:40:20 +0000
X-MC-Unique: n-lOljHTMkm4dNjJEocrPQ-1
X-Mimecast-MFC-AGG-ID: n-lOljHTMkm4dNjJEocrPQ_1792222818
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C424F1956074;
	Sat, 17 Oct 2026 07:40:17 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 672B53000735;
	Sat, 17 Oct 2026 07:40:14 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: tamizh.raja@oss.qualcomm.com
Cc: julius@bairaktaris.de,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
Date: Sat, 17 Oct 2026 09:40:11 +0200
Message-ID: <20261017074012.35602-1-jtornosm@redhat.com>
In-Reply-To: <CABkEBKbHhxNsx5ZpYCSDEKtC2UpR+PD4hSF1CeUOwUBkTq2XKw@mail.gmail.com>
References: <CABkEBKbHhxNsx5ZpYCSDEKtC2UpR+PD4hSF1CeUOwUBkTq2XKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi Tamizh,

Thanks for the heads-up about Julius's series.

I have reviewed it. Both series replace .wake_tx_queue in ath11k, so
they conflict textually there, but they solve different problems:
mine stops -ENOMEM by checking the ring space before dequeue, his adds
AQL, airtime fairness and a full deficit round-robin scheduler. The
two are complementary.

For ath11k, my series is smaller (4 patches, 7 review cycles) and has
no external dependencies, so it may be simpler to land first. Julius
already offered to rebase onto it in his cover letter [1] and move the
ring check into his scheduling round.

Since there is no conflict in ath12k (Julius's series is ath11k only),
I could split ath11k and ath12k into separate series to try to unblock
both. By the way, any more feedback on the ath12k patches? WDYT?

[1] https://lore.kernel.org/all/20260908135319.754140-1-julius@bairaktaris.de/

Thanks

Best regards
José Ignacio

