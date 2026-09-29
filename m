Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF7B5304D6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700736; cv=none; b=N9XSVdPWyDLT5TQQcLE1j4DTxY0rY/2F28DZmpcPdL45A8lEXxXV0j5XjEh17SKQN82FUlTkHlrwV0WzPbmZY54D3UjUhZqQMqNvoykRD7tMElvDr6CLBxvyeCZwxiNEnl3du/6Lpgwb3bucCi4BS1L9PYRiburC6ncsQlt7744=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700736; c=relaxed/simple;
	bh=u8UUARJnM9dWTuc1nPtuk8G4AIrxZXkyqftRXwXnkoQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JQ8Ou4G0yGunEzriQ2LGTCiI7/PdDQUuqEBXLUVZ9FJ51NyWC9bJOZQ29LzAdis4jwdmoZUUzVRP1AQYqLNBVNwaHNpH/qgZsF3MKAgTGbA2/UiahTi8az0QuYy58mJx0FLes6hzKlrHM9nQ1DGhry1JbSh8eUwv0PYiMet2KRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dyuoqX4x; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g6QTIBsI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dyuoqX4x";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g6QTIBsI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790700733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ntaMCk3istfCuNAuKpSk63vz+dko19iSPj+OOJ65RUc=;
	b=dyuoqX4x4Qb6oGkWsPBVQG7UuW4p8xRlIzrcY8mVK5jcMLjhbNVDnVlkG7LnijEjdnAnCv
	9uNpF23mMnSXtacNFB6iZUwHBbiGdSINynjsBSf5uIraC2HvmeESRBrMA+QdnCOI3FtroY
	dFd1j3wkCQpzmPOHb4BkRhBzSJJHgu4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-_o5m7TG7N2ypkH2KbGqiYA-1; Tue, 29 Sep 2026 12:52:12 -0400
X-MC-Unique: _o5m7TG7N2ypkH2KbGqiYA-1
X-Mimecast-MFC-AGG-ID: _o5m7TG7N2ypkH2KbGqiYA_1790700732
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c7d1c402dso346410885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790700732; x=1791305532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntaMCk3istfCuNAuKpSk63vz+dko19iSPj+OOJ65RUc=;
        b=g6QTIBsIcEX8K5BLKffnt3BWb7+Rji+pS0EuHst0jYaTlBzHq8VPhJlSzq4HwmkrZy
         AppDdoj1jhuogAWHfOxEmhv0wix8ZDYiVtuypZE0I73knMdRW7R5YZ699hNoH72mK7NO
         ImkYTETGRZgWf36Aj3L9aRu5OnjA7IhgiFnk8aoKglmjdXpsTylZEISHEMoo4APZAhNI
         Yqz213pcSxPEwJplavrYatTVuiLUP6x626EmZ8Gu2Okrw6wUxSN34Qx307OUHagvEntO
         7IbruPuWUC1HLRAMNdaegVqw4wPzK/JXdW+iRbIuh/xCM40MVa7H9zloSaetQ7y35NAo
         W1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700732; x=1791305532;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntaMCk3istfCuNAuKpSk63vz+dko19iSPj+OOJ65RUc=;
        b=xY9UBaT+NOvPKngdR8ADFSv9MHKoFE5h7OWTsiYirH3ZI7qxgjNdAJPWMznREQiWgM
         cmUf9+t2za2bkNobXpwiUdRX1Egq1EFWirH+BWbGIouAPKekk77jrtF2cyPPAPXdqa+p
         71LEV64beaZFNYaw2wpp44RlS93NEjJYWKnup38zG2sWwPP95kKmJ2RbXHl0icuVQJzq
         4QqgCXIAx6Whw4VPDJvYs831r/eybQDlkBNCxsCm/CWqdl4qy+af93J8vxSm81PLhLLn
         wnwSQirRm3ywi+btXtQSfQTvH8ECqJKtZCseuZHrWlPvSvTDRQhxt0+tqhun0Etd350m
         oh3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxdfEVzFwQ6xR7g1ADzFrnyCGZ2QuI2L24t3wU5D1jc2m2CGkPj+ks12xleTk5KN3a43RTOKC6WdMxM2uQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m8whpUyGREZyrxa4L3mF5HVxUKT1hCLHCypEpWRR+og7fxuecP
	L/RrIcTQavYjsk2hJQO5loTN59Kgslh0tZ2GhI6OtaADpbq/PqQ74Z779YNrsozRWlPBIvx0xP2
	S9fMyB++k9xX9WIgDe6iEpsezADFCamCvWtjJjToApimTeQnqV/0LF3aL3DOYrSvIcQ==
X-Gm-Gg: AYBFou1Yo6EP9skoCTOV56GUg1CieVd12EtxCqnwxO+Qwj+QwG7ttNVXr2xnYdxY/G1
	M/EuoBL2oKB8yY790YjGIyLtam+iAZN79TWjP+/NmAiFORbbzUBb2q+aoAYbkEFnZPq1iP/wIKY
	JQZniDeflSg+XSZXfqmtcEss+ckZc3nrGVycOgaHs3Uw0laxan+NPALzrUdXtzeXIITG/9Eh9GY
	EPY4+hKG0Iq1zLMu8uvOUYYj5SM5YUAvqbRbM7TTZXdWUBOQpWvl/1rGUrNb1SrNxMsfJGxeoke
	DbIHCplVdL4r1gxNU0nCo4fYc5prkKmwF6WSJWgIIjxksXwrZbi0OyFcrp6f4CN8Go0WEud9myS
	qyDPKP46OyxhUr9FZ/EGNR92R29uRSz5eThJIWRxv1Ppfq+kLNjI=
X-Received: by 2002:a05:620a:288f:b0:93b:d79b:9a61 with SMTP id af79cd13be357-93c9fc468b3mr9236085a.66.1790700731815;
        Tue, 29 Sep 2026 09:52:11 -0700 (PDT)
X-Received: by 2002:a05:620a:288f:b0:93b:d79b:9a61 with SMTP id af79cd13be357-93c9fc468b3mr9229885a.66.1790700731258;
        Tue, 29 Sep 2026 09:52:11 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f546693sm11365585a.40.2026.09.29.09.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:52:10 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com
In-Reply-To: <20260906-ti-adpll-v3-1-1f1ccda49c62@gmail.com>
References: <20260906-ti-adpll-v3-1-1f1ccda49c62@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT
 schema
Message-Id: <179070070989.199845.5903281798262570768.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:51:49 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=319; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=62+rscG0QJEUA2vTuNN1rLF/alg1AFPw4/CBZ/gPGqc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v9nxpU6gZIpqoMOv2qN7MxR+P3aJZ/Nfr/qqWivdW
 mDarE8PO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIu/mMDF+Np9U3JvrMuJ5y
 iuH73XLVVIZnOWwNokfzbp62f2zWHMLwT1/pcIfrOnbFvQYnjv85a1V1yS+oxI1p0r3ed5MPvc7
 04AEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 06 Sep 2026 02:58:32 +0530, Bhargav Joshi wrote:
> dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT schema

Applied, thanks!

[1/1] dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT schema
      commit: 307bee2e5a6ede1c50dcbf1ef803c7be44fbbcb6

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

