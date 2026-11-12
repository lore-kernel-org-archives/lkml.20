Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794490773;
	b=FjsDVuwK+0mulOyhBGTW3EAHthKLsa+qhmeeetewSKGyNgrBmQlaZIurHtKrMiK5T0eI
	 sDDoCHMAfr4j1YHjy1XEfYSfDeibVRjq6dcaqwI2WDWKJmO5NF1zfeWUSoVdE2Sh+YEk8
	 DSNuo7wcic0zBy9RUyRxHBI4xRToQMR01hkYOl82YQMNmqMiqs+HeUSfpRU9TxKRZNp7e
	 28CHPttyOLWQQhnRuZbE3xxRezRu7e+uullj0uqvhfSRM+hFUyUNhRrs++LeAfZzvoagb
	 dwJGBjWcd7fpWdMe5Hu+tCnjhj0/77a8slw7rj4TwTRx5PyqAR4SIgNOkzZ0uawEJ7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
	b=oKkXjYeTyOligPvbFsUrQWXamdBpUr7HGFsT9Q/t5rcbpKq+h5+Ns5bMc6AAYGpH882L
	 tDxPRC/0aMnIHQ6ZEM3yzfz3Pzrk0ZBLB8A6+ybbfJK18SUdB1CVM8U2tkS8FvgsVBI47
	 qYz1SpKpnwUi4IjYurFeQ2R9j5Qs0EcCKqb2xTWFimlbYp3Zly3fTtPZ6I6Db/atZEaFO
	 5i6uH3Ki53woyicXANOK3hiiVc4YLEHxOcHv0XBNwlLu/lhW9t4iouU3wFJvEWxZ9MlNI
	 cScbjqDI/cL/Kmk/w4TIguf6ywgsPw5TW6pNs0/LvD4Ma5cse1kFAxJo6K4FzuVrRqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3+kfEWc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE3A606A897
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE3A606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3+kfEWc
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e940d5d2beso16947785ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:39:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794490772; cv=none;
        d=google.com; s=arc-20260327;
        b=dAPUvHMG4Kp62GsL8XfNtkykyF4BSS2mug41ZceS+1UENrBg9eqmL+fJPUmN9A5ENB
         XWhnQMavOYxpFbA6tecH7mpSEQKqemsxfDYWO+yEMgxf6gKR702A1JZpRGr/9BdkEzAs
         CD3FE5QKem/5gfF3KRSorXhZq81itMBk7xeow9Fug1vatBRIJeRnrrxtGqxNcVTP2LCI
         pIAVU64yzEPoe8rMUpSgFYvuWYqsWIBK0L+ryT3iBOmgynL8sWTbUMRFkOu6TKuh0QBH
         mI9etZCrRi23SR8GYhRUMxxHgsLFjtfUZ8uekl/IuI4H78vXwS5i30bECsufGKbsIRaT
         vWCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
        fh=lJa3yfTcu07dUvj/BV44DhSFOqgiAACr3uZzILJx81c=;
        b=NDRcvdZJtHAJqQ5eEaONlfofhqqg6LMJI+wwHlxDIWI7hTy643Q5XdYLEdGB3Kz+RC
         uI0aJlyFIc/cS/AKkMKSGmOP7YWpfoD0bLK/2wycsmmQ6NNITtK2CGNrUz01jE4IWxMa
         XWWnJeFwFMoF7DGHxd62sq/O9my6KhUfk5kisXqDWr4q6PcmqcbP6zIJj8Ha9UxobOJR
         HZYVNgh/gmP/V+UEmPSsmDMQPBQrtHNHt0RMljfwmZOY878I13sV3BHx4LsWTG1md+rc
         aLe6px9kEU2ICrR+0qH2Cc2zI6yTU3gpYncg7a4knlW5RKx+hr/CXN8rFqCuNhGmfZxD
         LNqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490772; x=1795095572; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
        b=o3+kfEWcRSjRpnaVC5BXZKuL2kXjIQHclfzpt6+dHbhdh4Q6hf9C3pmuQuds+9EpGv
         XaxNNfh0D9MQ4cnsO6NytlHcJUL0RE6lWpqnrCQ+3QkxlmdR++71qXfGEXWn+N6dngcb
         bwAgvGl+3PYQ0cvL7dvepdIKzygBCUJqWR5ktSitplquzfJdrhZBFAF6oeC0H+IQ3zMh
         yHqyDIYw1v3VnagA0ZNV3r0N31Qb97+qe9VWSSm+I+AWbGmhoty5fvU1SQSIDm7H+bkg
         /ahGhTUYTNYcBepjiuZOI6JrH+7kYfWkSsHHi+vRV67EhJrWZUT04BfCTjUKF4RYk6uo
         InnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490772; x=1795095572;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
        b=Ln/38dEWt+zgPpvYWV4fkxS9ZBRtgnbOV0BQ257f2pimve+o8s4Cu4PsOFZAtg37v3
         h+4HVQTLljCX1OdsQqk9vEiwczMQVLtDLLMrV6A75SxtaVc1tPjJlRk1qCMgRdMILV2t
         872PphwR+s3dmJg108Hnj93/DY+br0XaSQYogY5cUZtqIYV+WjTdpwXkHmQ2JvEvYKyf
         PdLg1X4bjyvF4WjYBuOSHK2obAw0UuOTVoQ09Nyr85cwwABlT0xNBtLRAodoXsl72iVf
         c5LRvZ6THG3NQAkEUQ5CwNY34alNfU3+T2QtH95TtV29y9kNncC3+uiWx8+Gd194446W
         qouA==
X-Forwarded-Encrypted: i=1; AL+hErFxRoMIT1wHFS6EejXCN3Lq3BSPaiiZi2i8/hZxgsFu+m7ZPFoC5WKpvcEksmnOo5ssGk2FuH5ft3Nr/4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NHTKJIYEQcTwBF1x8cNKGvHbBulwczdt8KvgomBaaMeUhiE5y
	1ug8wqing9E1UYPfeQDUrdzAM2mGxaNdNfpfbtKn2+rq4TlEZAjo/WZm2Szex5iuINMPprX2Oc0
	H7ARVcnCh+WOWXIq/l1Nao8Y49brJSw==
X-Gm-Gg: AYBFou3Km9UM8zy3Oc9IQmY/RaWPXVdge9WRT8bNcc0QfFC/OcwwMVZ2Q8NzWHfMBeM
	2i8B3zIOlw3FIF27bdqjcP4TP5+MUBZDmDJ9/73/HySADyuLc8klgIqj2/52zrj5CtXRiRm3A29
	0dddx+riVn/ldM+w3fuHDbVznpOVIHYV13RrOyGS6tltJFICmcZghfmg/eRaw1htpXbiKa9PAfa
	RL+wAzvUE9nba8TVsPGG3436sL9BdXxJOd44djIjgx1bD2Y92RfSx9kqW3aN5ihSSHV3oQZ+9Si
	VgbmxYj98DCzcQYobHb0QzHseSk1IzFkep91f1P9bEOhaLhX+KdSYflCqDVVbQbKIWL0KvCqbug
	fW4fFaXkqcL75hptviCbLTK8eyFdix/JIgLHU
X-Received: by 2002:a17:903:3c2b:b0:2e9:723a:cf30 with SMTP id
 d9443c01a7336-2edd747589amr58537755ad.2.1794490772460; Thu, 12 Nov 2026
 05:39:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-m52xq-dts-v2-0-063289405882@gmail.com>
 <20261111-m52xq-dts-v2-2-063289405882@gmail.com> <20261112-sophisticated-peculiar-husky-c8ce51@quoll>
In-Reply-To: <20261112-sophisticated-peculiar-husky-c8ce51@quoll>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Thu, 12 Nov 2026 15:39:21 +0200
X-Gm-Features: AclHuK9wD85pxbo8x4o0sO-zJHkPTBWQEPCcLtvvrU2Ak_t5O0goATrr7wKH0Tw
Message-ID: <CAARotkfQxp0xE_XnixLeRLrcdrWx2PgC78BKv46e2NJiVnmmBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: net: nfc: samsung,s3fwrn5: Add pvdd-supply
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	David Heidelberg <david@ixit.cz>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for the review.

Who will pick up patches 2/4 and 3/4 (the s3fwrn5 binding and driver change)?
Should I resend them as a separate series to netdev with the net-next prefix,
or will you take them with the tags as they are?

Patch 1/4 and 4/4 are the Qualcomm side (arm,qcom binding and the DTS), so I
assume they go through the Qualcomm tree separately. Please correct me if the
split should be different.

Best regards,
Asdlerto Korry
