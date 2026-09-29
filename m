Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A4F361962
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698481; cv=none; b=aieJN2bTQzu550xEAsZ45UuY2ucOqW9WhAOMfirjJQ/Odt2NqAOR92jiMlyjqLkl667Ep87zeOKvcr75gip574y3ZiPEuucfrTWAbHfbvh3QkmSGtwWl94M9lu18YmUslHCm51dND68gLOQYI6DRUvTxPyIvQKBh4tSFBdcJ18o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698481; c=relaxed/simple;
	bh=2qKarXk++NiBS2+5AKJidUXBeAghThgQE8g3f72zFz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bf9RdLnid/HooJQvjFX1hN830G70N7GiWitw3BeVeFPleTqHC0c/7qj3uMjGas4NGmQLdUG4jaEvvDNfYmWMfRwvyl+/WDLoGW7u8mpMsg4VGe73wWJbQ0DKQyBMdu8M89m3RHd75Td+1CdtkFRPw4S4LG8bCUm43kkPokMPQFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DrjrchwR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=f+ZPdVGP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DrjrchwR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="f+ZPdVGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790698478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bmtox2s6c4TjZwHbdS6FzVWAuk54pYg3rXVMuHHI2Ts=;
	b=DrjrchwRF9DXFLPZ57lEBCJOGWCRHSFXsKB4uaZOIsnavcy1LQLl0Js5h61dWOkLVYJcLD
	Pmug3GHudrkujYkRJ2QJnWqyQM3DsC6xxk1zZaqU+d2C4Vtf4cZFdZVGLQZxstbJYX5D2E
	+uUpq/1xNukzTjpBswqFCHG3vJOFOAk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-Nlo-_UMSO4iD5YhtPWPuTQ-1; Tue, 29 Sep 2026 12:14:35 -0400
X-MC-Unique: Nlo-_UMSO4iD5YhtPWPuTQ-1
X-Mimecast-MFC-AGG-ID: Nlo-_UMSO4iD5YhtPWPuTQ_1790698474
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-914355c5a51so80068206d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790698474; x=1791303274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bmtox2s6c4TjZwHbdS6FzVWAuk54pYg3rXVMuHHI2Ts=;
        b=f+ZPdVGPm9TsbOIQjywD6IOf6qQSUfAXBtBpE5Uk1ipp6BdvN8fNxDRZnIeOSL2wv2
         Us+yOE069ntqWlY11lRiTxfTWGECqaTeqPTzpzq0FYwxYx4q0VNFdQpM8+bNRE1QqW6p
         0xGfP9DQVHskfvsQl6aANiXHRgZIDnpemVvpxk7vNFacmEU1Q97ExBDO3Y5PnILJFkqb
         bdUCOVivH6qfH/yfYMSUufzSxAKMudP/Tdi/hGGUogMJgyfMH7+7haOxhsIVRfHAg/SP
         LScf1NMpcV4n6CCTWJ2qNQM4JYmVZKNVy+z6prPm9EKr/ONI4T97jKtFScPMgQP4mF1l
         18cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698474; x=1791303274;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bmtox2s6c4TjZwHbdS6FzVWAuk54pYg3rXVMuHHI2Ts=;
        b=zeKJjfDBDh8OsaiDZGL+cqhz0dbILRYHM7KfNsawVXfckum025rDdwhHQY4By6PjjD
         1QFk49aVsOn+TNnKEKyURu+ZcCWZBkz02BRW2RhFEZ/IvmFhruSJ4r8wwHLYtkvbfPu+
         fPwGr6pITuj8YbWhU0SACg/Z+Ol0Yo1qv8UWYeryFeKW/JPJDZ5Z4Zh8zDawiFBO2Yxq
         Hmig32SJwwnBOL8w/iCCcpKUEVSnDRkaNo+ubVExQzyh9oySWcIq6pKVtiA6Xe6G3DdU
         HTddCmSBQpfmAl5bQo2HtMUaeci4kfb+if168taz6dhknX3Pn9yQLkDcr2bZdV31lwEe
         GScQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3dz7ajcI6hFCfv52RiWxgif2EinBRCQ/GHzrWj0N4kpTuBfZkg47Nvlz0w4cQ6eQzQn6QBVzcFxTeaTY=@vger.kernel.org
X-Gm-Message-State: AFuF++nRIU7qXpB3KbLF4zgLxSgTSWKRBUrwmLYZJ9lrVYqq/jRk382g
	SDZeQZckXZ2COneWtgNKG8JTDSYhqVmSCS0ibCS7lN3BY81bgLfF9Oo00ZU4oa3HkNkFDlYqORk
	+6H5Rasxi84yEH/hpRRI2dRfTo8ht0HU8jB0Jejlp30EUZByOzH0virz8mG0/mkMPMg==
X-Gm-Gg: AYBFou2pLc6n1s+aD4/2uqGj4bmT3TlMbhsEr4g1pxqMktY7jzPyBscN+x9/wqTxz0s
	xeaLkzEbjLUojUPH4b0nyAYZlW7zmC80DMVHIpZFRj6DoECJoRsDiTsaB49BXm+8tpmOfPc0GEM
	vZE075u8eAgtndj+tJqd9ai1/IWBqUlxCMM+C1S1LG2TudieZSZocMJaxi1Jv0czYMETDkGd4Gg
	J8Rmyk97Nmgm7REHquabZBRiXuzBp4kb+tYaLShwMzSyIHUmuaVoraWihQ0pgmQXVB20zLZS9Ng
	UvNFF3Vf5clX5f20OtoPZU5qMI6oiPkoMgUh7fx0gJOThPGigHpR0zsxzxMm5EsuTmO6PZ5+gHf
	J2R/3tVw2dNNXYWEdcUHawhM9RWrsZ03mxK1+jiIDQLVPDd82RW4=
X-Received: by 2002:a05:6214:29ce:b0:8ef:4ed2:316 with SMTP id 6a1803df08f44-917819e1cb7mr71156716d6.1.1790698473761;
        Tue, 29 Sep 2026 09:14:33 -0700 (PDT)
X-Received: by 2002:a05:6214:29ce:b0:8ef:4ed2:316 with SMTP id 6a1803df08f44-917819e1cb7mr71154666d6.1.1790698472201;
        Tue, 29 Sep 2026 09:14:32 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d326112sm13448196d6.23.2026.09.29.09.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:14:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Myeonghun Pak <mhun512@gmail.com>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
In-Reply-To: <20260626094134.71961-1-mhun512@gmail.com>
References: <20260626094134.71961-1-mhun512@gmail.com>
Subject: Re: [PATCH] clk: ti: adpll: unregister OF clock provider on remove
Message-Id: <179069843542.199845.6686423279941894529.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:13:55 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=313; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=sd5tjkRycxPIdAX6vTAKeWmD87abOzSi5YgkalY7KF8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2P36w9WTuFvH2Necu/j0fcb/T/q3D86WPc5y4Xz/v+
 7z6nexLq45SFgYxLgZZMUWWJblGBRGpq2zv3dFkgZnDygQyhIGLUwAmYv6IkWFO/fmvx1h/80sU
 vGP8/GzNzqPvLtisuyBjGV979unp/z+OMfzhjM7o8re+psN3fuux439enjRm3Vq9w+nHycUx+Yw
 ic6OYAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 26 Jun 2026 18:41:26 +0900, Myeonghun Pak wrote:
> clk: ti: adpll: unregister OF clock provider on remove

Applied, thanks!

[1/1] clk: ti: adpll: unregister OF clock provider on remove
      commit: 4c943ddfc24340f1b899762b1ff35c38306b7a35

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

