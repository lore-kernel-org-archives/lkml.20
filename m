Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686070;
	b=q4zzn2HqqU82F4eXaAR9yaiFQts1m6uGzA2JYxwzIFYTEAQVSaAgx8nxOnYRFFVDcyxB
	 1+JrWEMTIYOTdb7hwRj7Qy6pwi85mtAEDJZHQXPfaAJr08J3iXxBTQMVbwbgFFjnGRUfi
	 a53kf706+X18VocZMSJGIq6wZFjubGrEYsEFUvWedfNnGrx69z+ahJbg76h2+M5e+uRoD
	 0+5oTRLrfhBvLTw8wlpNCSdoFSG+cMRYweBqxUHM09iIrzJm0ke5WwleX2QpirloneYf1
	 uItIRrcXSmITTUYWeliLLTQSepzXfCCnmCTkAfYbe9+IuQPNi2AHxhq6o7k5wN4nJbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686070;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=wwMXdVcHWj7VNgwLkXURMtAFowP+ywwx/JvFKagWc38=;
	b=krfrNHd/ctfiWtwcEA9ebmINWSE+HLFMM06smljrSN9PZSwXF9qhNMurWfSZ7LvsyxCQ
	 lfG17rrEXj+Aa6fFvtqJk8ISiBVuvkJqfCyrxSudLCq/0GN063qaedAoe8gVaftnGQ4jL
	 lx9xkh3PQ9bZAg8vZdS3cuadse4SaYKS7V1GhzDA1xy6NSZ5+X7nhiYfggdvViAHNFeLq
	 3T6YntVEu/h/GWfrJarmHIA7kCxlxqaCHnPd1v5rNg4qXUHRB7IKhZaJIttWSkmNpK7sM
	 8R591qQeMLITTWViz8dFY5JpvujZ9JQWQZMPjwZ/gM9S3EjDGWc3J8SIH4vLQMqbIyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VyEUwaa8;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D41606A337
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D41606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VyEUwaa8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793686069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wwMXdVcHWj7VNgwLkXURMtAFowP+ywwx/JvFKagWc38=;
	b=VyEUwaa8rbLf2n42QLECOas5nqPNywDtqC4LKTRh4bTNhcJrhEkyeDA/IUe503qw3CsGY5
	kkK45vp38nane5oTkYisDE1BF+NpPNi0RxeC5kbR7t/JlvC5X8vZk3wjCDTanMjiPfJxqM
	yyZwixmPLjyIaEwdXXm8DOTfECrhL1c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-231-5vqILIpvNNKt6mHTo7xz6g-1; Tue,
 03 Nov 2026 01:07:43 -0500
X-MC-Unique: 5vqILIpvNNKt6mHTo7xz6g-1
X-Mimecast-MFC-AGG-ID: 5vqILIpvNNKt6mHTo7xz6g_1793686061
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D64391956044;
	Tue,  3 Nov 2026 06:07:40 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C013A30000E3;
	Tue,  3 Nov 2026 06:07:35 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: seanjc@google.com
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jgg@ziepe.ca,
	jjohnson@kernel.org,
	johannes@sipsolutions.net,
	jtornosm@redhat.com,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	kwilczynski@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	pbonzini@redhat.com,
	robh@kernel.org,
	vkuznets@redhat.com
Subject: Re: [PATCH v3 2/8] KVM: add PCI MSI hypercall for VFIO passthrough
Date: Tue,  3 Nov 2026 07:07:34 +0100
Message-ID: <20261103060734.34199-1-jtornosm@redhat.com>
In-Reply-To: <auilKFwKLjw-BnZM@google.com>
References: <auilKFwKLjw-BnZM@google.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi Sean,

Thanks for the feedback. Understood on both the NAK and the timing,
apologies for the rush.

I am exploring the virtio-msi approach that Jason described, which
would not require any KVM changes.

Best regards
Jose Ignacio

