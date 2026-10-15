Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6148344606D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048182; cv=none; b=I+65Gvzdc8XXh5KfoWQoVuy7NUMOExhzYD54E+dzjqJcakpveap1BW7ZbD+81Y/mm/ZOMbFxgGUHeMOS43S5+uTorWVgyXHvNaO8oBkvau7Sx33+YYxlLxXKNPO/hu3LLookgCJnbXMFPQArCs1hXmbLxRRVto2YhjY25IF1xtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048182; c=relaxed/simple;
	bh=vSE6SF/O7vjB6gvtVPX8GgYZcDaIDXMtT2/2oI7pXAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6QKAt0wuHxaKBpnjqMSe9U80g22pIANw6RSkpGjUVcGUPqRfr3IqIgfSPkJ2U7TaCKMA4zGcZ+Vclu1Pib6HMmFannHV5SX4tolJvI5q0ng13xfkLDQJ0F0dUD9pEnCHEV1+txmHDFl41K84Mpq/j9u7eQAZVXknZRD4m0IOQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E8bfIOi2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E8bfIOi2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792048173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vSE6SF/O7vjB6gvtVPX8GgYZcDaIDXMtT2/2oI7pXAI=;
	b=E8bfIOi2+SL/h6/v5PIsPxDuHYbefI2eNLkfLoBFNMoFA7/gLusXJ79RAkovVAn2Fa5r44
	Nm//OmdcY6wLSSl9B5huSKWtomeKR/Lp7DNMdi0KN8QpathNdmgEvqekrqSVYHlKY7N6yW
	hfBYvfh8a9G7fhIisYjZ5DHbf/4Ak/8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317-SirXxdeDPEuJ2pN2inpTCA-1; Thu,
 15 Oct 2026 07:09:28 +0000
X-MC-Unique: SirXxdeDPEuJ2pN2inpTCA-1
X-Mimecast-MFC-AGG-ID: SirXxdeDPEuJ2pN2inpTCA_1792048166
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1BCE31956067;
	Thu, 15 Oct 2026 07:09:26 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 485A8300072E;
	Thu, 15 Oct 2026 07:09:20 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jgg@ziepe.ca
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	johannes@sipsolutions.net,
	jtornosm@redhat.com,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org,
	skolothumtho@nvidia.com,
	yishaih@nvidia.com
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Date: Thu, 15 Oct 2026 09:09:19 +0200
Message-ID: <20261015070919.466876-1-jtornosm@redhat.com>
In-Reply-To: <20261014150047.GO14213@ziepe.ca>
References: <20261014150047.GO14213@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi Jason

Thank you very much for this. This is a very good and complete analysis.
I need some time to study this carefully and understand all the
implications. After this I will try to do an initial proposal to work on.

Best regards
Jose Ignacio

