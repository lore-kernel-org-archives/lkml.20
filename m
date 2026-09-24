Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054BA4E379B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286870; cv=none; b=cuUhoXt6mw0WBWqnVtLA3dlKXs8whq8MyHs/C3OIrIL0nAbJVbZsAIMHpE7fWfXjhkG7BUTqZpJK3iXksQ3XXhMz8qIKcNagnl6OPZyS7734Eg63xZKNgu53j74n0COPlYeBJzEKIOXCATg2jd4Zq35oy6acOTJIboaCvsju3oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286870; c=relaxed/simple;
	bh=K3t+LaWqIf9lBw3vRzbJsWwSHz8qVHJ39IY9rjX9FSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3Denr9nyrpTdfEaVCUNXd2gjxWTozh+guz34yl7gRbrNSFu58tqi2CufDXbtvOswFZZp5futedz6BUwI2TKBRbrlzaDxfRUl0f6wEd6cVxEzySAjo5PrCZfDXCnlIT6W26IVqy1XBqEQ9kk0DEt1H+2Qyn+NjMz6HM+AVdV9bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chLh2ToN; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chLh2ToN"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so127398f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286867; x=1790891667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3t+LaWqIf9lBw3vRzbJsWwSHz8qVHJ39IY9rjX9FSU=;
        b=chLh2ToNPucc1oDYccp4oDB7fQgOE65YxZkJNVxJbIWLcixeyUsRppLAENPd9YZOmr
         BBVvrSLDA8CIb/Gc2tAvWUM1/SojGYw3Df5T9faBEbG+F1MLwlLJKbSJ4hO+erZw0P6g
         QEtfENTqNTehKUyx5r/fACQC84MAYric7dJF5RwbRuvZdns/HFsh5Yr01rwJXmGqUV3/
         eWJATdlaqlEHzvDwxxNkTzMwF6s7B6Ie53eVp3Ef30wyhBtpDT/xD5g1laR5z/xJdBtI
         Z++JUJFxD+IVs0dAt6QTYHt6uGwbY+7ahQ41voMFXiKENlKUexhgvuzVAWlbesOkHrkK
         V3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286867; x=1790891667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3t+LaWqIf9lBw3vRzbJsWwSHz8qVHJ39IY9rjX9FSU=;
        b=PeEiICSpopnr6c4PFvFXw5YUA0Lnr70tzUtqusnw7cXqx6g0ZZAQrSTa4FvBQzbNaC
         6p0KcSeYuxVtNAsx6edqnaS2DUh4eTe1mX2ZXsE67FoUGKzo3jW/VPu+pCialLNoCFVQ
         YfHmS2yoqw/KcRTIAaQa8n/HBRqssSMqSO1/9Y2TFepJgBMC1pX4TwGCGi3zNN87YrNp
         //AEdbSAeT96zTn3VBwHePBsAx/HDNS4AyWZxDjG3plKE7JsCh5+Lk6w+KcekJzV3HWJ
         LD8cUe2hhp5jJgZ3qZXf/czRmojCvmA5mo2O2tAuxG30ltG+EGSZW4XSJUQpim77laf9
         cmWA==
X-Forwarded-Encrypted: i=1; AKwUvBw6Kk9h9SRRGlfQPcdzfQI/2xKBo4WgVzl9pzCtqisEMBAw/1KBnGiKtNCT8zo56UCaSv71xtSZbojDu1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nAaTZT9CemwfzDM3Ca5asm3JuyCFt/Ta7YmNhD2FLOimciE6N4
	y4p6R++cU5IoBxPJKAnNtShINaldL44+nxuCr82RdoZytVp73gL9HCRd
X-Gm-Gg: AYBFou070FZNzkkBkIXIGxm9Fb0rwyjbLcZfQogMbDr/LAlarj+//pX56+vnMLb5+dT
	BObILAJhgNCVASpybYYqTuTNfANklul+mNjXvdJmCO6o+5CmL1C/gGDJB/iwBb9o+Appzzp0AUy
	wLFauSrnESDtcHYm6aJZA3eOfWqzxIj3UIJaZW7MJrCRFYZAHg2W6K64DWDJh/ukYt547Flvy4o
	Cv2UpUVNvJS6HfJfdRHAAOfxzhaWUruxsiuQP8tees2RozhdRTpP9/t7SeICNx1WfCM26FOPHed
	37qhIjTd9fGIneUWQzpA6dptjostnK++3bm3HnzsVg32wX3mXj7ek1O12axDVI6L3AZ6S1nCL9Q
	qsjLgslkFC5O2VFi7TY4x+rCrOJOPkZaxXBpjXdyq9oc+ZsRu0mScRjhrLSnsaCJDQJbIthR17x
	GWyNIVjyck0jwzpDIqoB2lCrkOQl0mT3qzsAqLRADDW2kEPE9sN6oVu+9JaOqM1fuzhNsYdPaUt
	WjxB4oT1r1R1YuUgiP4i37eXsLbuw3xcLZlUrohBeUFy0cczTGmNpADB3M9jxECWksNI6cP1cqs
	HTseftPyQBG7bYdKTYL8v+ynB3A=
X-Received: by 2002:a5d:64e9:0:b0:487:1575:ebef with SMTP id ffacd0b85a97d-4887176868bmr7025346f8f.47.1790286867087;
        Thu, 24 Sep 2026 14:54:27 -0700 (PDT)
Received: from 1Z10 (mob-176-245-31-160.net.vodafone.it. [176.245.31.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355d96sm2382024f8f.17.2026.09.24.14.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:54:26 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v7] Input: drv260x: Fix suspend and resume sequencing
Date: Thu, 24 Sep 2026 23:54:24 +0200
Message-ID: <20260924215424.931989-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831150323.2922792-1-mauriziocasciano7@gmail.com>
References: <20260831150323.2922792-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dmitry,

This v7 patch has been pending since August 31. It incorporates the prior
resume-failure and teardown feedback, including deferred reinitialization
from open() and unregistering the input device before final work
cancellation. The patch remains unchanged.

Please let me know if any further changes or testing are needed.

With Best Regards,
Maurizio Casciano
