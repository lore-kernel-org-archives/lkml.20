Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7D72EEE79
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697151; cv=none; b=ti2uyuIJ6ufx2AeP+iKHTrhte+FoMYcGdVR2cNobwghaP6J9PR2NldFdVVueDRyZt8Yrjoe+NtFI/eSbH6b9iMG1K4HmeoiVSVOMOSr52NZa/SMb+Si/9qfW8AWjB3yb+JSBeqIdPfIdFkSntlR2g/aKEpS/64uilaSZ9P0UguA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697151; c=relaxed/simple;
	bh=ZhioHhKCI3c9+3BTGfqNVVJyHhlhbfeWZ3cQGaxcT3Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AnxvjwSmYTWqX59DY5NY7NtU13Vwn4K2uIPePQSylEgyJ1AZgBDMeBSpMg2+XgdTYamlZeka9neJqG3UdgDKq2BTBa2V4KHpugjYnfC5r/uITjERTAFbcethgMpqS87qilu+/homA3vABD4CpfgSslcZliI/tVUSkRPXljkO0hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZzK6OUPp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hIcXm1rb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZzK6OUPp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hIcXm1rb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790697149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fsdd/ZfuXmaiSsfG+5vAWetJ7u+NesgPGBI4SS5aNWI=;
	b=ZzK6OUPprazgv/duPlku/fICRK54gEj++K7t1o9vmVu71Tu1pgka9Q1Fh+6tO63BdiSb7N
	hTwkuz1aDgFZ70vrOWrk2GXqSdB3RhlqinU8rA784ICUCtAgEFAsYuEgWC+1DN/ckIXcPj
	/QyMfhprUQHp697zL5QabYqChB3noXg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-lROl7FpBP7-fxdX7Jj1YKQ-1; Tue, 29 Sep 2026 11:52:28 -0400
X-MC-Unique: lROl7FpBP7-fxdX7Jj1YKQ-1
X-Mimecast-MFC-AGG-ID: lROl7FpBP7-fxdX7Jj1YKQ_1790697147
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5328dae1305so72593191cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790697147; x=1791301947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsdd/ZfuXmaiSsfG+5vAWetJ7u+NesgPGBI4SS5aNWI=;
        b=hIcXm1rbNSUC2IVlsLaIK/UbU6LwWoxGb98VpHDN09pMj2vBNpK0lgKlTSGK/WgNTU
         YhRogaqq9WNdZzomqpV0tF69O8j1Yq+AYnxCMtpbmbFSbJkTDz4Cof5qPup6vfXfGFsW
         4r0lhz51abY/RX1/zdM5EqmpQB9NkoUkmIM7701RxmeoZ7mMdUWgzU0FWY6GPyYlBRHU
         nK8QrDlKqEhWRmbwWvbA8ges6jCNvKtFETZwAVne39+wFj2ogfwJ0QPiauurM6+yB/kW
         il5Moq+sNPZK6RFCV4gIEUXm8ToGpYWg+CVCBblo2kjJx5Ym8ME6SLM7zzhnceRprSeh
         E2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697147; x=1791301947;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsdd/ZfuXmaiSsfG+5vAWetJ7u+NesgPGBI4SS5aNWI=;
        b=1i3beo7P+WvsenwkEuQLsz08P8UpIo3YCA8L1tEfqamTpT3892rQgv2hHx+WhkeORu
         JTfrz9VJoerZ8bsu2t8g9hHtzkbVS1cz4uz9Hh9oD44AJpmWbJEvp7v5J8DQP/bJP9JH
         uaN21KDbJryQerDWxQxdiEkh0vFzFWGgUob8iMIcbZANR6wsTz1hq6hwZ+0QcJ81lsmY
         GWzGFQ60Hrt0ONP/d7y0NtVtZHUr1jAw9FZrcGoRscY322j1VPCw3oklkbSD3oVRIxGa
         EeMRP1CtUlCkW93WVpPuMCuz9iQja53swPg5VoFTxHldtp4YnPjgiY4vzaW2MiBqLKsO
         uzfw==
X-Gm-Message-State: AFuF++lU7oB40Bgx9FT5deOSwWMol3Up++IdwyBKc+rLfcnLMFFlLdUY
	FbNbBenyRPBQeGWlkFutmDHPkrUeUa/EZBS+QVcobvpu+2mAEJ3GLrNRZBVUVKqqnSX283a5KcP
	4KTSFafJd1Sn22UFj6vBpm87+x9yViyNb1jkwP7lCc5oQpyFYFlDPo5JgBRyNG+kf6A==
X-Gm-Gg: AYBFou26/lkJrl9V19BSObvE6YuL5cL69HcASZ42MhmOmTQjqvba2DMaUtNKcCtMBsQ
	XAfjIKTgpWnGNa+ZlDAjVmsHim/pJt/tvXxX8h0qYm0O2w5SSlvjJorL7mJcgnAtqAmHa5y1f+1
	mosmAlLiiLsWC+Rtiuhzd2KNUe0UdsRsGflanlJLJphLZlHxGFjav0we5BL9QN1MrcUO6vadECu
	yBpF78Ycr4AuNvop9m/iHohU3XtWYF5G3HwJE80anncEuA6M7n8JKdcNGsSaTDo+Po8YFO+AI3S
	nUwbkTGHUuNRVPhbCL1agXnoIxrEO4Cs7XYXudzKZvoMW+HmD4IEgApxV4b6tdhvXQzdriN3m5G
	xSj/J/OLhA7kpfUuLj+fpXcHRN4govO9lWnVgnRlJmhHNVw+1Exs=
X-Received: by 2002:a05:622a:a05:b0:533:4359:b6be with SMTP id d75a77b69052e-5334359c1b0mr126510361cf.9.1790697147321;
        Tue, 29 Sep 2026 08:52:27 -0700 (PDT)
X-Received: by 2002:a05:622a:a05:b0:533:4359:b6be with SMTP id d75a77b69052e-5334359c1b0mr126509881cf.9.1790697146764;
        Tue, 29 Sep 2026 08:52:26 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53322020e91sm89606841cf.1.2026.09.29.08.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:52:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
 phucduc.bui@gmail.com
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260724070457.24007-1-phucduc.bui@gmail.com>
References: <20260724070457.24007-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] clk: si521xx: restore cache_only on regcache_sync()
 failure in resume
Message-Id: <179069712462.199845.6340553951907887636.b4-ty@b4>
Date: Tue, 29 Sep 2026 11:52:04 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=351; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=2VVbrhExCycg0VvIpM/2JFaJtJS75797ZuxbfhvmGSM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ239veUd1xem/IRpMLZw1eZUcfb+JZpfv9xuvVvB1vG
 9YHPH6j3VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEYicyMjxq0psq+dr9oIRY
 OzML79Pw2cI9r0xNEuY2dgj+XvC7tYqRYfP6XQYlXld3d/1e/PzKZ5YTXB7LXzR5hPdGGwUuuft
 pAjMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 24 Jul 2026 14:04:57 +0700, phucduc.bui@gmail.com wrote:
> clk: si521xx: restore cache_only on regcache_sync() failure in resume

Applied, thanks!

[1/1] clk: si521xx: restore cache_only on regcache_sync() failure in resume
      commit: 906fddec02bc9381ca872544820bd4d610cfa20c

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

