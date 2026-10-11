Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C044570D1
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791730865; cv=none; b=rffAdausZ6FUXw23MpoUdT4SAWAdOzIyKtD6H4RG3a87CgAr5wlTgsqkyBNCXjQfH5Oph73HDNzDQ/ueptOhpuTkuOcEZuQ99FFYT2xgL9RqGU7CB7qsMUBRm0sOUgb765S6iPoideg+VHX9ABlH7KU49KChCIiSnZ3pecO/RlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791730865; c=relaxed/simple;
	bh=4OCSru/Lbt4T5vhKJNlhummD6FRhpLVQSxbJ9kBbnCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SIiOWqN8JdOMvbI2PgTEzyTkyh17KHbVuMvvuzQ1to2PP5ZFnfemzuI5QpTJTFiyDEMNM3GsV0rWCqBLFZI5iw74v7ENCs5pNXpBt8xPAw08eSY7aHRpYTbHtQC94m89ePyD8VEKrcMlTkF85FfC5Qn+DTLpkKyVFaiVnQwaIT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=K3yaYUbH; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="K3yaYUbH"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-535853983f0so12864551cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791730863; x=1792335663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OCSru/Lbt4T5vhKJNlhummD6FRhpLVQSxbJ9kBbnCc=;
        b=K3yaYUbHjm6lUfle8ozp5hAnh1D7J18WP2WSk+mR7VIzOdsCnJtUgSoUAk3uWPIQKQ
         Od+kDZolqAhfQGkJ7bdYEfFb0hiHfJNlGvzxL20Nck85LpccN1SMpMruwvYJKLIvGoqA
         wBYNBmKMdBk3JtOPosBPOI5ys2SFecTlmIbYie9DTr4cx1tx23K0wYgOARb+xDcbR2cX
         8donjyZJ6bwzX8djYva2lRAyuQ3O/yoJaRWe7O3999BDnzyhGroL8fgUb3yCR7pOuj16
         Ev7LWvx9nBoanYH7IMqw2Ht8syzkfjPxKwH6JBDpcnGjj0f33dRbSafla62iBLfbxjgg
         fI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791730863; x=1792335663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4OCSru/Lbt4T5vhKJNlhummD6FRhpLVQSxbJ9kBbnCc=;
        b=WLcoUTUdJYEPi830O1KYHWSkf3fAZFZHlrheX1fhld8qkf8nY6rbMwKzYYqz31IgPJ
         TnRdbyabUB7v5O1EZVPssGrou9Eo38at8n2vs8svY1gDiEZKa7IUfbLn+vIkqBQNQicW
         AArhufidTlRzECy5Y4+CB5yfyFSAnSoV0O9tHN3BnnbsCe3H2jF8JH32Oyqe2e6ajZcS
         bbChI/b+2Dv/PjC4wxgUsvTECrHGfBPT45QO2Cz0Ik+qFdEbxEC2OAZMIRk8J1Gyw8xc
         aiTeRdvjiWhHOHWSpNtz5njdZ4gpF773AMRuvaPxMXw99LLclTurC7CK9dwuv7gkgPi/
         4TfA==
X-Forwarded-Encrypted: i=1; AKwUvBwaXtOhzhsF2M7ihPpy15rSVldPECRsGvoW98mmHJBhwZqaX7tQhNyq8FAhqnYTL/2noW7HE5/8w+2EnQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq6qVBReFgLX21GADRr4DyLzP6Cm+YLblAGZviy61Ny3YrpTFc
	pYjnt9A5luwPBK0P2qr+vyLBh46S37RNCgX3avtmbYyV8W14LNnD8/IdWUFgXIrpzA==
X-Gm-Gg: AYBFou2j/PCoxm0pvH8zchdFgCfzyshv8GxYVTflFTClHYJZWgcZEAGPl+hsqqoXWYK
	FVef9RqGxeXFLkC2mV9IyiKAFkyTjbAIRoR/GJaUFdyXwC4qrJjahZ+mMac6gw5ifjqroL3+hKY
	5uFNxYI4Bshw7MEhYlmosA2GNp4qZ8ufBwqXdkIEhIMT/WdoFyVcWhozQR47OMIkUhXknG6j81K
	4y0lMSCvotow2ZrVnzQRsDHUogNarXTGT8QrPWb7DgNY/hSxpTDQ4mEzX2I0TFxtHOgMI+B76Ct
	FjCAsVU8XA89w/FVZLXLASBp5nheSZt4wMlf5Kk/8K02bBVN85NBIygxMfVMI7OPUgt2D8u3RCk
	o9duIjd0N/+jOA7KqxlXJAEMSgbEBjJO87W9VPsO6NjB1YdFVC03X9QZsirZMpMgFOf7d50qiwA
	38AOpypG/M7DO5cuE3fVNNHz4prHNkScwStFnVL+zUwr2ai8RqpbnGNK7+dTB0XilpF6oftPzRg
	1BORnv647Ki8LTpq+o3yg==
X-Received: by 2002:a05:622a:1909:b0:535:2db3:c05f with SMTP id d75a77b69052e-5359fdeb97dmr128255601cf.61.1791730862788;
        Sun, 11 Oct 2026 08:01:02 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b76eea2sm60407431cf.18.2026.10.11.08.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 08:01:01 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] serial: core: fix TIOCSSERIAL and TIOCSERCONFIG on uninitialised ports
Date: Sun, 11 Oct 2026 11:00:38 -0400
Message-ID: <20261011150038.1466236-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ast-JWIDzyly6WuI@hovoldconsulting.com>
References: <ast-JWIDzyly6WuI@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Johan,

Thanks for testing and reviewing the patch.

> How did you find it by the way? I assume you are not using an ISA serial
> card?

I found it by comparing kernel behavior across different versions. I was
testing in QEMU with the 8250 driver, without a physical ISA serial card.

Hengyu
