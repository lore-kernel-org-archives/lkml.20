Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98208284690
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630940; cv=none; b=jqB5ZLaeE/yidKiafJhZtK0DjQ8e9atO0PS47FhLiT2WmLg2FnWyqkdGgtVYJvQ1BTsBT61Pi+0Z7A08fbwcGh0CETpcHdPAdA1DbtbDgXeXXzyE1Iv27E3QSKpTT1w0y27e+NtxdhFqucOCgQbBPu253nha8K/56KndW75Ad1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630940; c=relaxed/simple;
	bh=xMxOVldMppZYEYJrsXwBLCFt4totNBD3YxtZh9MydWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NUOPXiyMtA+hXYxq7Ff+oNRQzoHI2C1ESPyGDuNhLO4Dx+2w8qa4A97kKoK2zMAysj/lFukC7ArY+hkmmAFyHta1xcvACoJj3ScFwkzqEApZgD2IrzEHK8A9UznfiAM1DlTU+4hH5oJdYiXcXinZN1qFbsoARYXMEWY/WRKQSxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iAR/0uJ2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iAR/0uJ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789630937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMxOVldMppZYEYJrsXwBLCFt4totNBD3YxtZh9MydWg=;
	b=iAR/0uJ2bdxMR+OQ1JmoJuYZ0Usb4oCN6JCfUYurqF3+WmYgbRsp/e752pDtWZnvQew/TO
	8QMQOvxotc2JGNZMx7d3wIOhCWeSHzm6arqvvXEmNyngfvyXp/c+8cvV4RKtmSd6DVdank
	4XsFPdHcBASyrGI4wQMkINgHlELjYLM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-253-GQDA2DOYMw2bf1RgTwG5uw-1; Thu,
 17 Sep 2026 03:42:14 -0400
X-MC-Unique: GQDA2DOYMw2bf1RgTwG5uw-1
X-Mimecast-MFC-AGG-ID: GQDA2DOYMw2bf1RgTwG5uw_1789630932
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C2BB9195F144;
	Thu, 17 Sep 2026 07:42:12 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9BAA11977588;
	Thu, 17 Sep 2026 07:42:10 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org,
	baochen.qiang@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 0/3] wifi: ath12k: fixes to improve MLO station stability
Date: Thu, 17 Sep 2026 09:42:07 +0200
Message-ID: <20260917074209.15553-1-jtornosm@redhat.com>
In-Reply-To: <20260804175004.1761075-1-jtornosm@redhat.com>
References: <20260804175004.1761075-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi Jeff, Baochen,

Friendly ping on this series. v2 addressed all the comments from v1
(rebased on ath/main, removed HAL CRASH_FLUSH guards, fixed radio[0]
usage, dropped patches already covered by Baochen's ML peer ID series).

Any further comments, or anything I can do to move forward?

Thanks

Best regards
José Ignacio

