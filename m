Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49D044C66C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933037; cv=none; b=PNGM4XEWfOYawXLActElZrQ60SW+HVbjwk5lsHdXYjn30TyOI9B0wGubf0T2dZ9FWjF/6OV7u30ulqjsqhLHZYHiEivX03cqUKhvvHQ3fSfg0PbMg9bltixtvM05aECHrFBuSzPn0Q3o58et7cRlWMYxXMtRQsvDDkpG8NXUOJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933037; c=relaxed/simple;
	bh=257ZYm/onK9NmjFUuWheeVrDW0MEc1CP8eA0y4JopIc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y1olxmMKKJNHRsz87owsXs8yXTZBUB5JChOMH3acn0RtejFaxmbRD0VDnqvMiuhX6QEb+ralsPCpV48xYmQsFH4kEeiDNbN6wEKeQP7mN8vfjWY6X0aFSu3ACBsUTGZTFG9HACIfUgCrRXgWCFqT4HZVdU/MRXccn6o3W2d7QYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RRs3eQS3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=D9nkYNLu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RRs3eQS3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="D9nkYNLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790933034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CGtB9v1GsGLaJhfSAUhIyFl6i0Nim+LY1YL2weIAg2Y=;
	b=RRs3eQS3SSr4/8Gx2XGeNRd43O0QDwtERdcBRTEqnInuonwii4KD44bTwt8+EVt/iJXyui
	Z34pi3V4BhKvve+tKuYi1jMEx+2QRWI3/AKQRtJfccSR5bmAU+4bF2CPhgSgZ9NXIwK8Dy
	UQWOZ9pEHndTdFKFwMTr0Xx6rLF8GnI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-USWggRVxOai8M0G5KYRe8w-1; Fri, 02 Oct 2026 05:23:53 -0400
X-MC-Unique: USWggRVxOai8M0G5KYRe8w-1
X-Mimecast-MFC-AGG-ID: USWggRVxOai8M0G5KYRe8w_1790933033
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca4a2b9c4so539817485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790933033; x=1791537833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CGtB9v1GsGLaJhfSAUhIyFl6i0Nim+LY1YL2weIAg2Y=;
        b=D9nkYNLuDsQx8ACCJyWFwqQrehvlXljgKQARuwWLhR0D4BttXwEu0RXqFnmpmKXNd9
         WUyGiKiAAl62Xj4i6Zeqh0G0vA3ykTMRrHdLgpnaRQXVnDoGljWgzfgkH4YFL3vHsNIN
         skvUAxSiEDATlzy06eL7SoMQ0Zeo8ChL+/Zb7T1R9jFWF+3GjltyBjlehPSrGB+eqdV5
         6eZeiJgrMKAgxh054HPqTiB6kqT5pEdREXxY2Wf4dF0kyu+WyQYw5SbagSlXbwBBDGWU
         D742srk1/a+dtziwJCgT5ZqgU0aaaSwk4pk3VCXPhEMj9XvHFPdC0ZVro8qFxdVzSE1v
         RL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933033; x=1791537833;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CGtB9v1GsGLaJhfSAUhIyFl6i0Nim+LY1YL2weIAg2Y=;
        b=QWmM0veI9pKgD8POeis8CA4faVpjHqhcIZxcknugZQF0upipwUb+xd46c3rnOrJ4u8
         vutEsaTsiaPtMUHzxYodI/fkOTMCePpFfvEQo/m13AqwKdWctTMT4WMrOM5C36qar42y
         EDDTsxt8FA8r5/al+IM8NxN4z7g2f+KLfRwQGsXvmPcsVXuLYHocQP5arYwgL3wGIsQ5
         QvZN24H3w3COqBLjH1SrYWszg18TpmDo4F/bpP4h9RE34/yA7+RSnDsdj1UdU+kEE69X
         aw8AO+21o8xQgXJ1QcpZ6JfAzqPjpKKFlbHDQg5h5BfRxh1o1XDrnTTUaYeLsXiQAEGs
         pLBg==
X-Forwarded-Encrypted: i=1; AKwUvBzmfcjXkUzlwxaNJhtEXcj7gEaBzs115/dscU2eSUWOMIXFU71l7nfh1ksIhiVvZQozQBapqE/Y+xk+SCY=@vger.kernel.org
X-Gm-Message-State: AFuF++mRkagfi+ZGeaY/5RuNG9hGQRdThB4AM1IIkhOCf9Hqxar/eRMt
	90tP7kBkvNdqYq8dIdXa0mrJ0L7ogqrh6f4G6/s7DBjMcIN1wguaCfpcy4oFaq1OWilMeDsW1RD
	S/dIlepJgLNigo5PZO8EncR/F05XFq30rL/Cc6H+7AymhgMxqtLYIJQKfPOsZPntjE+mo/QTIl5
	pp
X-Gm-Gg: AYBFou0jpWJnqZgrAQOWQxZhHaXZ1xtWnnm7yZzRo6oWDhOfYcroZjcKkrmt0UxGJU0
	SbPfRVPR+GzLtRhQWqdz7EfBmpaMHY526fnGlElKrUJgR4BcuObGL9FekVm7Nd2k6wPmP2Tfcn0
	h0gTxkvyPuLWWuHN/9V3+tPKjYj9sG8rPu3Z9L7Iwr39pmwXDYoEIR5NXxVNy5v0GE2AMJDInK8
	zasLTYf9CWumkNpcKKICCWBfGzYGv6prD8vQpJku027Lc9IWKF4EYhSZIq8VR/KNupzBAf56sH1
	OQXu5bk+VdAyT305IpFaWI3l9TPfJQlNVYXOhPd6/EhAiUR1L8RS+lJ4GAb5ZJd3A0SdEn7oajN
	GW3o14eYxfCAFkufxxHW26eUHXSGFRcO9J7MIgmRTROhs4FwNYBzvwydVoa8jw9qtO8mQJrgQW/
	NF3R5eLvwKhqdpvw==
X-Received: by 2002:a05:620a:9504:b0:93c:b719:ea07 with SMTP id af79cd13be357-93cf1755aa1mr266819385a.42.1790933033041;
        Fri, 02 Oct 2026 02:23:53 -0700 (PDT)
X-Received: by 2002:a05:620a:9504:b0:93c:b719:ea07 with SMTP id af79cd13be357-93cf1755aa1mr266816885a.42.1790933032573;
        Fri, 02 Oct 2026 02:23:52 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca1a4312sm170545185a.10.2026.10.02.02.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:23:52 -0700 (PDT)
From: Alex Markuze <amarkuze@redhat.com>
To: =?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: Re: ceph: fix 32-bit overflow in readdir reply count check
Date: Fri,  2 Oct 2026 09:23:49 +0000
Message-Id: <20261002092349.1638909-1-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923202533.2229953-2-Jeremy.Jean@oss.cyber.gouv.fr>
References: <20260923202533.2229953-2-Jeremy.Jean@oss.cyber.gouv.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jérémy,

Thanks for the patch.

Reviewed-by: Alex Markuze <amarkuze@redhat.com>

-- 
Alex Markuze

