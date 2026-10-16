Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F155195B1A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171225; cv=pass; b=GNAGke++E441sOudNcjxYxezsCdzUOXppeSqe6v480/2hr17cjZ6HGOyY8vcrTNGPjygSrOm5JG3Uy7pKkXe2FcatiS+QDhUqm7AZjbHRQscf/DZvNZeAp2sd+Ymj7q2yrfZjkYcCpJ63xRiiU16Eg4JbyUFfa6U4LU/EBQyFhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171225; c=relaxed/simple;
	bh=MiP0/OfvrCvA4rJbJ0HuMjTm1tAB0xvIAwvsxL8/19Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GsXFsEEEVu4ZeQMrfLU+FqZj2LRKcnHReDGGOOE5YKhmcN4NKhA2i2sd77+25loHhaqF3yrzp2UTycPIKbbyCpsQ8LgiUy25hTz1xrQhqa60PF15Zwtbkegz4q0qyzFo5f++39LCm9mfxFTBFMFSH85Y1rXOyeC5F0z8E232HeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAee/JcG; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAee/JcG"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so185752c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792171223; cv=none;
        d=google.com; s=arc-20260327;
        b=p2u0bxYqMwvZwaYAdIhOuh+WvT0K6PqroLLjVGqqq+OyvC5de7CiLpUKMMayPFQ4ca
         QDvrLMTfAwt6IJhi8TH5Hpm41S5D0M70syJ0/l7N6YyTUoJXxXJBxSBlKc6vTA5/KqTJ
         u11SaOgIhMN5HURQGmhpEC2VoLWHEmNnJNBtwrPVWAcBQqjh73cw5P/FnLlB+s8lmLnd
         MqRto6OZgdktk9Xzjd/cGzfr6pOiamfudLJ9l47wgT0lcvE2eLeC0x1PQ84gTH+uLsK+
         YmxX/lrQi6+5QKwA46pxMu/i1UGNcPDjDtifnpWeVX1LIDAklgncTdx7JX0QB/E9Sidt
         xLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MiP0/OfvrCvA4rJbJ0HuMjTm1tAB0xvIAwvsxL8/19Y=;
        fh=DwMu89WlkOq9cO6B2xSmBQaYxJZTWrtDJ26sXMstzM0=;
        b=MnSHJyMptXWu2rXakrDWghVS5H8dVNIb5IBkvs8Uw7gwJDykbrnkUQMrYWHcMEvJQv
         yGwcpOpBUeOUh3jeVwbiQ+yeSE2mm0nugR1v6KCRV219r5uhVSkQc2eQqmyjejMF/SY4
         CTvjfkx/gdnQbQgpKdIrRjVOFmFYGg80KX3iO575mjVd0nGTgMTx7lK4UuuhfZIRBT1g
         RX9JJyryj5DtPJJFG60EHKLdZtX5Ets9W1KgYx6Bl2SibHjc8zjMJA3Ybglzj6Gt5/fH
         vNSZrRlM1FxIhxMjr8fTWmNrFDyGN/mj+XaHt3XDln0vRRfabJOnMVGBsY6AdFbv7EtU
         MnIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171223; x=1792776023; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MiP0/OfvrCvA4rJbJ0HuMjTm1tAB0xvIAwvsxL8/19Y=;
        b=XAee/JcG/e86npiS5LOzJb6mYusWaZdUjAQ1M+WZBoq29FpOTDZRUESQ/TtNJcLcSH
         krSdKU3vbWEbKfI4IX0uY5KtkGZbPOdyeXu+1FomhWOKpPPzP+PqWhka/rbZHpCMuTnt
         S5YLsa0kJCHj867tqu4emJPindeFUnqCW1QnyLzEa3XfHwBmS0TT1/e0wjQpRbJGv7JW
         CRaDz16ikymcBCFYAXUAY47onQul0ogt4Tasdomow8I4vcdlS8OiTLLE/Ad7HQSu97Sx
         XF/Trn5fXV76hwOIhMaFoyNu0+l7vMpanKKxK39haqTMbItpfkqK1TunCuLOO2oLIWqX
         CEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171223; x=1792776023;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MiP0/OfvrCvA4rJbJ0HuMjTm1tAB0xvIAwvsxL8/19Y=;
        b=U4de54mYNacTUU/ta7uy6+G6UbvmGe/Vs/Tjdr5Y7z8eoOVGa4zQOl2Q/zUPv29EIa
         dZhXJ93VepVkfYW3gwupHE11UAsa1k7q1zOuAc9HLeoNkv3Z16rmF/aDQKXCjhR0Y5E2
         dmY/+NfnHTlh7fOTh805nnbMcVDtXBwck0/uzVkMPn3kqa/3VygDYlE4l0jld/c1EoIp
         m8A+J3xWF24+JhlAc7w6/uiloT2LG0CFyvudtVrTo4vH7Ljyx6wBnmEMibSkWplHaMHM
         CEZxciSyoFauq23qOSR/V4cw9KA/9eXnkfVJIZzjVnpuiqM1181rosiwIAiaYAbK9H+x
         MJtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjM87+DTrA0J/b/2TejmF77LanbInm9YMxrlaA2tnD6HWh/thpxENGHgz75VzZ6PEosKD9AuhkAbF6nXE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIgcfgdY6qktdxKSrqu2IIVTL7F8F5I4JStdv3Ti7ZTYjMagl4
	lh8hz31rIJk5fCfb/A7CStjuZZ9F+EF8CCcHGLLM+D3dldRIlq3Onxeh+QK4lLcCu4a5naEjtkY
	gTi7iLUyXLYadoEgNEIFwqBAOjd1KNkI=
X-Gm-Gg: AYBFou3UMtImXXvvv9Aug7VfR7BymMnUUFZdu4T8+GmN5J5K2CmtFNXJnu65VuIpkDA
	GGxKepRLOi407nPAFKQVfOauqzzkpGJmEj1BZ9cGBlTOK3F/hD4ZRyvnpKkjJkVdy0gfAi4IFkN
	jTLJopn1dms6jywFCWpZ6ufM6iB8PfREUKpR/MLOLbFuTozBvMq+ydqFzclQ5sDU1tCvtjpRwTc
	cycJwH6W91j1GIo1BoPOuufzyRPDKLHu/G8pZvK23SNpwvyQYoMfHrQl4vVA/O0K+4wojMxCXni
	nGQMGr3WIfrzhYgKeg8ocAP5Heqa3HctCRF3RQzjINeZQhue+cY3qohDUK0QDmWXFiY6ZZCiZKr
	0W0Pg+YoMxj1Z9RmtSatZXCopJlX+TfDccqHalWmoySVumBxxDBzwERBkGERgo4d+xD0UuKetSS
	71RZPv4nx04YgUx+6l4GJYpw==
X-Received: by 2002:a05:7022:7e83:b0:144:c12b:dfc6 with SMTP id
 a92af1059eb24-18514a0bc6amr736465c88.44.1792171223208; Fri, 16 Oct 2026
 10:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012034020.100737-1-oliva.scorza@gmail.com> <atHkgyGbF6TR-lT4@stanley.mountain>
In-Reply-To: <atHkgyGbF6TR-lT4@stanley.mountain>
From: Riccardo Oliva <oliva.scorza@gmail.com>
Date: Fri, 16 Oct 2026 12:20:11 -0500
X-Gm-Features: AclHuK84seWErEQdezQ7ejBx3BT29fQ44gl29cEvTvBdMD6FM3ekTXKHgel4_qE
Message-ID: <CACseTmkGtaLQMhBw4CwwH7Ym1NrGi58y=C59rGiex7R6a0O9QA@mail.gmail.com>
Subject: Re: [PATCH] staging: vme_user: avoid iterator variable access outside
 list loop
To: Dan Carpenter <error27@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> You should generally assume old warnings are false positives.
>
> There is a check which tests if we found the image or not.
>
> regards,
> dan carpenter

Thank you for the advice! I'll treat the static analyzer output with
more skepticism moving forward.
I appreciate you taking the time to explain that to me.

Best regards,
Riccardo Oliva
