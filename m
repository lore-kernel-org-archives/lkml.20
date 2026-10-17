Received: from 1.mo575.mail-out.ovh.net (1.mo575.mail-out.ovh.net [46.105.41.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0127E39447C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.41.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792252587; cv=none; b=uVDwAAbu2Kl9TQ8CAK2qqZkKrFnFB3tlQaZwYKwhLLcNVNbEz3uHfO5qLQRECEQ2F+yvJliVaLr/E9LXJPTzDjN5LjkdL69N0dEONfykUm1SeirpViMLIEGCB/Q97Ag/sM0WpI+0yivqCGvUF76/USX5xg/57Qi/kqbUf+VvTxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792252587; c=relaxed/simple;
	bh=uCQaig9rEgF3+aw2tds27Jcd3vh04Y8p7BFJnWSwwpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0dKAVK6YM38wKXLpSdNfQiYZWOLbd4CvOBX440HJIOdhWfKrLIV85ExyQHv8B6ldzdt6sGPrwpx9rVCGRZVrQ19uhTiP9YAMY/8CuJdohok6leiXw6RPOJXiopkCTcQrDu8q2pcOtJUW15e8aoBuexeT/O1XjOclzG+zeXbRwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cynove.com; spf=pass smtp.mailfrom=cynove.com; dkim=pass (2048-bit key) header.d=cynove.com header.i=@cynove.com header.b=XUZFJnG1; arc=none smtp.client-ip=46.105.41.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cynove.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cynove.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cynove.com header.i=@cynove.com header.b="XUZFJnG1"
Received: from director11.ghost.mail-out.ovh.net (unknown [10.110.58.15])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4j6Qw33Sxnz5vZv
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:39:15 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-lmllg (unknown [10.110.54.2])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 066D5C2921;
	Sat, 17 Oct 2026 15:39:13 +0000 (UTC)
Received: from cynove.com ([37.59.142.106])
	by ghost-submission-7ccd8bbbb6-lmllg with ESMTPSA
	id cwkeN6GW02rJaAQA3SBaag
	(envelope-from <stephane.debusne@cynove.com>); Sat, 17 Oct 2026 15:39:13 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-106R00606d3a3a0-4c64-47ff-91af-fdab2a6dd61d,
                    E277A82C44659F51833474C02B8FDD9281845D64) smtp.auth=Stephane.Debusne@cynove.com
X-OVh-ClientIp:176.150.47.247
From: Stephane Debusne <stephane.debusne@cynove.com>
To: changwei.zou@canonical.com
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	jeffbarnes@linux.microsoft.com,
	lukas@wunner.de,
	horia.geanta@nxp.com,
	pankaj.gupta@nxp.com,
	iuliana.prodan@nxp.com,
	sahil.malhotra@nxp.com,
	sahil.malhotra@oss.nxp.com,
	martin.kepplinger-novakovic@ginzinger.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] crypto: caam - Use bounce buffer for unaligned RSA destination buffers
Date: Sat, 17 Oct 2026 17:39:08 +0200
Message-ID: <20261017153908.2813630-1-stephane.debusne@cynove.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017102047.333792-1-changwei.zou@canonical.com>
References: <20261017102047.333792-1-changwei.zou@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 10854519530342570812
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFItG+dckT/CYq7g4nK61jBfak3V94fQHIvYK7SXdxWl7LpwJIUCm5QByplztHFQNN/lG1XP4gSF0UmDfDjreJDWVsXPcz+oE+3K6XkuCtP1ZNd2QH3dAqaKohcBtkU7KVYj92bY/7wuf68ev2MoAsp6qszwIKgHCJXHAWAMwo/9DttfYFwmB5v6etLK42WAatG+S99/R+PtEOBO8Wq7FaXcvO4P6UBSsVzixbYtpoMvwuLv6GnxU10qry4rLndw70Aq2h6SCE4nC/K9MOOImziXmzaIzrdE8Siinyi+rLHKPbgKlbbcYbiJ5Rs8gYaJFnjJ+88n+oD0Ce+2NiE75RRSvayBj63c+383xmW5c2YyEO6lctyzn8lPCcLsOAUksljlCWYWmXK01kxhRYphvOOscu436SS88Lls01b3Z8Ynz/f1Cjy28iH/BTM4BxMEoQkwxyqctPFbLM1f6MuR/WYKq8+SGPOxl8+4/KXyTdzUG9tIjg728yKOwyjwdkYHZsqvzJkAcCuUnBiX8EPrsqhp6/7NdLQPkiksCFRhf4gKwYlai99WfDrVK8yAyfO+cvt0Wr6aEj7TOv4HY+kNWveP2EKyUZWcu2w1Gjz595/lo2ZRSkRCCgtp0XScW4Q5aI5hjk5t0mUUbaHO8DJb/KpydJmIP/2cQrjiUNqFKpUfA
DKIM-Signature: a=rsa-sha256; bh=uCQaig9rEgF3+aw2tds27Jcd3vh04Y8p7BFJnWSwwpQ=;
 c=relaxed/relaxed; d=cynove.com; h=From; s=ovhmo4616632-selector1;
 t=1792251555; v=1;
 b=XUZFJnG18D9d+4WJNzrc1qn2b9kDLvEeP3UsI9saQPpSqXrGKh2HHaTOQrdc82ukEo9Xe+0D
 EOWhFaQM1/AMv2bkpNAlHorx8UfIBN3SdeNUuzwoEb9KcDMnSuPiQMdwtPq//s5fpD4NePIh9IJ
 poW8jjASlKPcRXzvbkfknbyZHAcPoQ5urGALOybEPQoLx5tRotMQld7UdgndjMZn+mAen/GLgVL
 ElSZbQ7YVPqabFonbck5H31FRs7TpAlIEfFOyEqP9UKz5H4CkigFgMHouQHWyxXctTL4Ze9cOdA
 cDZyQhH+CLnJfg8HOG6LUTkMAhRDJP9whNaP9IjNP8l/A==

Hi Changwei,

On Sat, Oct 17, 2026 at 09:20:47PM +1100, Changwei Zou wrote:
> Therefore, I later switched to a driver-side solution.

Thanks for the explanation and the links. I have asked Herbert to drop
my series.

Stephane
