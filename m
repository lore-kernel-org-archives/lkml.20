Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8E147126D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390022; cv=none; b=MopLP+hoIh8drMUmPAkWE31/PujgSUM1Tn4ixBx9gOLzDoD6muZDL+baXBEZvihFf4df4uyvIpO99m3XXVwLrf5Y5RueWXilE5i4yEdU8LkMsMGAYQsGgLpXlN3t3A5QWrWtoBiCunY4sE4wOyy6OihaivsB8bOZYvSE5pMRz+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390022; c=relaxed/simple;
	bh=xMSmm+qEwdaTOP0e0g3GRGSXbkVVOBn+6DVhN+VKS/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=efI2waQH+b52UsMIAXRRHjIpS+Z8CueZodIa+gspLJhPv+v3jE7zUoA7tzQjZs18rXzFLj4i3wddpGt65oA4fvpLC2QXjzdaApO0GQasDXrSMAckgkHbin2vquEt0hzuj8csBbGKP4TjdMrRVmVsmNZkH/D7SPHKH32k7MDr+II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SY7Vhmpa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SY7Vhmpa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789390019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMSmm+qEwdaTOP0e0g3GRGSXbkVVOBn+6DVhN+VKS/g=;
	b=SY7VhmpawXm8VkJq38qj7Ugdy6yU9vAfKeK47Xswhn9Xdw5AyF/i/BC/NOC5pj2oNOjZPB
	Zk27Nd3vXGWx9XNdsVSGKn1HJKS6/ye22/J/fo+mwq4dNziX528bLUwMAjTYkSobJ5LrGR
	8NbMa7RdD+P8ieRnuliCTyFgXYW2uyY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-378-NSkAlAn2OcyIQLPrhwE7pA-1; Mon,
 14 Sep 2026 08:46:53 -0400
X-MC-Unique: NSkAlAn2OcyIQLPrhwE7pA-1
X-Mimecast-MFC-AGG-ID: NSkAlAn2OcyIQLPrhwE7pA_1789390011
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 96069180ACD2;
	Mon, 14 Sep 2026 12:46:51 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8F1271956041;
	Mon, 14 Sep 2026 12:46:48 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: bhelgaas@google.com,
	mani@kernel.org
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v13] PCI: Add device-specific reset for Qualcomm devices
Date: Mon, 14 Sep 2026 14:46:47 +0200
Message-ID: <20260914124647.25054-1-jtornosm@redhat.com>
In-Reply-To: <y5wemns4rjjfhaykkgghuyjiqqygx2is3bcyflrclrirp3lqh6@aiwdkaycpvuv>
References: <y5wemns4rjjfhaykkgghuyjiqqygx2is3bcyflrclrirp3lqh6@aiwdkaycpvuv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi Bjorn,

Friendly ping on this patch, now almost two months old.
It has Mani's Reviewed-by and has been tested over 100+ VM crash/reset
cycles.

The approach was developed following Alex's and Mani's guidance through
the series, using device-specific hardware reset registers.

Without this, Qualcomm WLAN and modem devices cannot be reused after unclean
VM termination in VFIO passthrough.

Could you help me to know if there is anything blocking this in order to
move forward?

Thanks
Jose Ignacio

