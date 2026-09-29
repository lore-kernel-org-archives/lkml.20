Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DCF3AE6FC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699029; cv=none; b=N5Q2V3wEM2F1pQFSsqvnBu0mV6TtEcj4x18M22yU9vq0l2DLr/DUiDxrFrIPJRYGSMmhsLdhzmV2WtLj3sGbNpcpP+Q1Z1V2SwSJ5AR15kLqL/78mmODcM4vQmM70xrRy1mJ0UbGUtJlI0GvzvuYMmM5wB+N1aDYSivhP1HgaUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699029; c=relaxed/simple;
	bh=evkrn0j75RReglnxUhvOP3feEazxnHrK2bSv7U5QRhQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XVDs7FyEuCbNvGoImFEyPgtsMvCOi2SZpj6Gp/2sjFSYQQn/Y8cnYVJVq+F6stWBlNTypRTvSdJ8LyWXFvsLl+kpHw/zy+moLc4IkdqqcCzMmJzI2b0Jwxs5KzHxtOAW7lxFpzKvy18HLMY3jEOg9Zz6AZ41zM8FbTbrHpueyU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J99PSgV7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=T+TEKgmS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J99PSgV7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="T+TEKgmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790699026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t2GK2VSdmDafmmBxGyGfx0WplyaoJRc/Tp0fAq4VgQg=;
	b=J99PSgV7Q878wrKer7KDBkHHwPMSkZH331HefYF2Su/AUtT/K2OoLCg7dnrBHpBtKi0/6I
	pkoWodM4/KOJ7G7Yefzr3CpLOGIqtMF8ByH8njbcJc19sHnBIHFvrdOlDrqMusTj2OBh3o
	xCd+cnuTyJzrBRmDEp8IcHb+rMr/ul4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-XIaMpar9OmuK8XEE3lZ5YA-1; Tue, 29 Sep 2026 12:23:45 -0400
X-MC-Unique: XIaMpar9OmuK8XEE3lZ5YA-1
X-Mimecast-MFC-AGG-ID: XIaMpar9OmuK8XEE3lZ5YA_1790699025
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91442ba2e46so72230336d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790699025; x=1791303825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2GK2VSdmDafmmBxGyGfx0WplyaoJRc/Tp0fAq4VgQg=;
        b=T+TEKgmSncgG98x7Z04d/W3CmDEEsYrt9XiPfQ04QAB4J5b9C8LLesAkuA1olyE9UH
         Fo7z0hmh/9h7Kg/GWewx3u5sulBhbyRkn2zfF/ZdC8wrzyS4e2mB9WOHo2JY89lAfkIy
         WOyKjjygY8ufPxTIBRClSnOajnJGPow4tS7RBxddfDqwrBS+pS+wiI7YFFkDobftKQ1T
         9gaGkPVH4oZQIe2PvMESDn9ZQ+xoukM+Brzfs4K00KjsqvunO8PwKwAMExNCjCDIX2Pm
         T5unVkOibDQwxgc21TG9HVP1+wIKsFZPRK5I3oMG1OvZJnTxh9ZLVxS9v39dTMUxNS79
         4Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699025; x=1791303825;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2GK2VSdmDafmmBxGyGfx0WplyaoJRc/Tp0fAq4VgQg=;
        b=tedwQQZKU/k9RNNBJ9JAPb5vDCG8DwLVlbfwtVBRS/9kwpQ5FND9Mkg8OrnDxUDqyE
         Re5fOTEpmsagAXnB44HRFKq/cq0y+R+Dby5NQe67pqUHFLDszSOcaAmYLepC1K2a3DZg
         lGBcRWg6J8hjk0CO3b5dzzD8VQgS39UU0Kh4jYTww9uA6Hrv36Rr64uPfKB84SUiGiH9
         94SjF4Aw3UYbVcDI4a+wfS53UlztaD4mxD2/isbLXO0Dt3zbCTPX/XOIpGPvhrkot0Wa
         U4ZXIqK7VtbsRYZC8N29DblARN8mWXVMXCkkL4PTHQx0jqS9tDCGImsBSbyDdrs4QjFH
         Vj6w==
X-Forwarded-Encrypted: i=1; AKwUvByJC6QBMaSstGEjN6acPDJ+LTZ2PKOX3oTE5yxyidzJ8cHYZQQYhxQAe3d/NF+6AP3dolKP5xkImtw/nhI=@vger.kernel.org
X-Gm-Message-State: AFuF++kC9iAleohCk0DbeJ7SRcqHsYXDHr74+2rwpCPblj9TYC3ksKVk
	Xt0xC9TBYEZJSwyiCXaEOSBPWSzv/K12hUjK4JIVwNDNFHy3Gg4Gw2WwRDyVCSOJ3dZiyI2ervl
	w9fNoXAAmL/h8Q5vpOmxvMFjHxUT9+iwc0krh5OXv+t0zYOZBw6ia3QDyROqf1wAfNQg6B0o+Sw
	==
X-Gm-Gg: AYBFou3oFZD1e0VyZga2zYak1xqUP2P8lKP/nAUGZAyGpZuBHxEkI1Jdk/VSXAMVvPh
	z1CO+rS+Nlvej+JqFAxTgtsBDVRdrQudyhnVlJVOxd/CLHGLWabq40aM54NFMZyMd1Zeo9YviFX
	dAImibpNhI+Dvi5jPsj5Ev/02IPWaBdb54fyvSZZP3nLpwjIZcKVICHMh6LCCiVKwyLIJUoj/xA
	vvDsU+qtC3c7xwE9ypB4P2ZpZoqO+zMolJOFhiWnezE3MOBr9NhgHGSF2edMA7bKK34pFXDXlql
	QEugjBLWHtM0cRhl2odqrsf1em3bx2tZp2z41Fs1nLNJcmvcSFlBIg/ylqNJ0EUVJiQtqZFG4Xl
	NgoLG6VpKUdyRIJwpHIoZNSz7db4tJ+3sTLDD5AbuKIFJGiOUwdE=
X-Received: by 2002:a05:6214:23ce:b0:917:8964:74c with SMTP id 6a1803df08f44-91789640eb4mr45316466d6.20.1790699024800;
        Tue, 29 Sep 2026 09:23:44 -0700 (PDT)
X-Received: by 2002:a05:6214:23ce:b0:917:8964:74c with SMTP id 6a1803df08f44-91789640eb4mr45315646d6.20.1790699024126;
        Tue, 29 Sep 2026 09:23:44 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d3726b6sm13632146d6.39.2026.09.29.09.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:23:42 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com, 
 m-chawdhry@ti.com
In-Reply-To: <20260719141236.3563471-1-egbostina@gmail.com>
References: <20260719141236.3563471-1-egbostina@gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: Convert TI Palmas Clock to DT
 schema
Message-Id: <179069900262.199845.14288580116711428199.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:23:22 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=318; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=oHn58vqKcd/4D+xRhJXn7ToD1HJyCAscD2yUqTDYu2E=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2P2M7sOXJ6yzTF0sX3N6tPmWDfeeUp4klMsGZvGdZ8
 44XcaoFdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRyn2MDHsWMjFZ+n+6dlJ8
 2Uzmf1KFhbY7AtKbX785O+He+YqudRIM//0NIsQvZ7bUmJw6oys6+U2UWfXkrm8lF7u3lMyKOt5
 8igEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 19 Jul 2026 14:12:36 +0000, Eduard Bostina wrote:
> dt-bindings: clock: Convert TI Palmas Clock to DT schema

Applied, thanks!

[1/1] dt-bindings: clock: Convert TI Palmas Clock to DT schema
      commit: e44caef8848790e3515c7c32bd3460e948613092

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

