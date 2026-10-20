Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792469639;
	b=tLgLYSY1hzwMeK249SSHuHzAbPfdU2LBJD2BEUHAh1/RQAGpAoH9U8bjgqQsAxV9ojzm
	 e3fKfEdqnSoi/iVhvLtG8oEtw3iXjami9MjFTGruoy1151QpnnHLgn8S/dAb9M2nnPxvt
	 puYV1GX3Wn+jbONrHJUtvVPKwQcBuOxOjeme0nTPDqBFndG1oUIWmSOcvXbQUuytorZ7U
	 8eI04+3IpTVAoegjczZjp6jhG0QsdisW8nDZ5qlA9gluc2wJjkodiwc57kY2PzObTWrI+
	 tzmq8KW8m+tBP6OZvlNi/FpjHeoON9KFJbG99YHsBWHnPo1Ao9fZZyGmJjZUrzdTTng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792469639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2/utcRZDsDy2R0+lL/l2HBc/qClTQkS/AfS2TFqCYOA=;
	b=3JEWKHpxwvSEvVAHFN2wpHA9poi4jUUON9zwZR07N3OHZtfy9RNgoQ9MLV/btWkgrRhL
	 vniXw8Quut09UvLhknGG9CYRmUNUrHWvfWjPhYiqNtrBeHJPGv79YNFNwUrInWJ4WnWFf
	 tqmH+zfeal7r8ywtE/G3BDgWqA6bu7xfKy+qJyCzMCr16HPC8QN3eO1yvRMU4DtAHQmZN
	 ImURfiZSweWspTYfbrx+nN+NQKraR/+VWNGwWEOvsAIWlqVehCC7g8ObzQnvBVnQRoJMo
	 /K5qN/GR2AlJvHgMxDTgoNo0A623oQRSwkTUjyAN38qLmVOuKbAFdUTIsVoDo3jMfCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mzmsb0cn;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0521606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0521606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mzmsb0cn
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35f1f76ea84so5143270eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792469638; x=1793074438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2/utcRZDsDy2R0+lL/l2HBc/qClTQkS/AfS2TFqCYOA=;
        b=Mzmsb0cnkw57AFOWQBgOp5U8xPif0dtCa6I6PZLXNeVSR2u2co3ZlTPsJz0pBGKJbu
         Mp6gA3CtT9Q6EnPl+YmPyJuiOfgYEYdMX85qcuWTu+oRXQgV2V7I459Sfr1T07Bc5iLw
         rOkFN3y9lpoAGIh+NWj2nRkB9ll4y7UrKH2+MsKwkivPHRbpI2X8FUPYRDV0xmEvQqxQ
         n0s7StUk0XbeR4gs3NTcMLFQ3Jo+oXNUKeyAbG1E8vuoEZDwbYy9claQmqDpACy8LvMN
         IYIDNJn7UGl8+zu6vGAMXlIM5LOz4xWkBcuop0JKypNufrIuwjb6NxHg6/1PQI1cdnwS
         5C1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792469638; x=1793074438;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/utcRZDsDy2R0+lL/l2HBc/qClTQkS/AfS2TFqCYOA=;
        b=kHb1pdBvqGjZHH1Na8aQY8Ub+XqbOI5gZiyN8m7PK0TN85quT+h+Mm+GcqGDpTBjQk
         kxJFca8SayYxTEo8ou3aZXtjGj5S9Vcj4cgQsWMVtC1nZuMtm/g85umy8DnYoB41E5oE
         LT5ZNQvRn+eD7JVUTCJsyMRE9twkKR4h26DniBN0poE9iDQD4rdyzc56OF5KMPUvWvBr
         s1gzciBrae2fYTcE4XHkoclAJgRgGXxjk/jXZhL1zTdoUjMUc74p0rjMBcCG5xzC5SdS
         caP1I1M+qPdM0auSSFJNxwnhhbWCRTuvXl+jm3uk0YK8jKSJnkDwwjMRIb8FZf5QG6kZ
         tpRA==
X-Forwarded-Encrypted: i=1; AKwUvBxS0I4bj4r1jy7LijVpPEl7lCtOWxaIvzl6u5EUP18cv3QIjfRdkfCNwVTTDR1MdMssOdfr9BmbPx+VsJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTXlosr1QnW6a1RUJjJBqRmOrKYNtDZc4/xUZm6Uny+S3/1eUS
	I/QH8ebPhL0Ga0l1Sg8yiD1t5H8jYJ+AuyzYCtr7HNSr3dKiuvF2wElf
X-Gm-Gg: AYBFou3zwpmhW27boKP5kVc3xQoTpmadrTtQAppfzs+UM7bbnJnCU64XcR6q3PbVuh8
	QHQjCt3QO9f/iDutFzdgrdrlrRdhOd5aWDPaEye9YxoU0K8C+F+QhX4EzRqfwc3mNJ9bY7aAMSh
	NUECaxpTIHQECMFYZ3aAGFwJedbLutbZoqdTOGrgbw+IOGROLI+ai91FGLOZVGo9ZsDFT0N7RWw
	S9FRye07YEtqJIdwE1mFwiT/X0+y2T27kPhGIsgx+1t5CLKvpO5XOVwrntYtdR6bOF2c1mZLWYG
	jc49RsfblyCk+dssP2myTciUoOCpFQ+FPKId1npNpNoaqWhJqMmR6UeKqY20OzkVkZqv+YlIsy6
	/XhgHgt9DT4yno/jEqY3VL0AH3EIwYwuDDaANchWQAwuLvwdfG+SXXSPvQMXmZKuVVZlC1/emmX
	ZEk6sU8mmphepOp3x6ZnYIJl6P56pVediViHoz3xu5gLvVJcuYzb7q+fzQNiZrW8/HBDi4Ofc8w
	88krkb8AyokJTh5AsmjghxA4RB4X8F2EK8eLBpm0wdzzrCgvqPMJ3fwgIgf
X-Received: by 2002:a05:7301:271d:b0:353:5d0a:dba4 with SMTP id 5a478bee46e88-361a2449313mr16329625eec.36.1792469637694;
        Mon, 19 Oct 2026 21:13:57 -0700 (PDT)
Received: from fedora ([2804:29b8:508d:af45:a398:9dc5:b37c:dfa8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm38861428eec.21.2026.10.19.21.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 21:13:57 -0700 (PDT)
From: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
To: danielmaraboo@gmail.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Subject: [PATCH v2 0/3] docs: translations: pt_BR: Add process documentation
Date: Tue, 20 Oct 2026 01:13:35 -0300
Message-ID: <20261020041340.447727-1-lucasadramalho@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791933697.git.lucasadramalho@gmail.com>
References: <cover.1791933697.git.lucasadramalho@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v2:
- Patch 1: Use "registradores" for hardware registers in the DebugFS
  section.
- Patch 3: Use the Portuguese Sphinx labels for submitting patches and
  security bugs.

Link to v1:
https://lore.kernel.org/r/cover.1791933697.git.lucasadramalho@gmail.com/

Lucas Adryell Ramalho (3):
  docs: translations: pt_BR: process: add
    driver_development_debugging_guide
  docs: translations: pt_BR: process: Translate
    researcher-guidelines.rst
  docs: translations: pt_BR: Translate stable-kernel-rules.rst

 .../driver_development_debugging_guide.rst    | 244 +++++++++++++++++
 .../pt_BR/process/debugging/index.rst         |   6 +-
 .../translations/pt_BR/process/index.rst      |   2 +
 .../pt_BR/process/researcher-guidelines.rst   | 188 +++++++++++++
 .../pt_BR/process/stable-kernel-rules.rst     | 258 ++++++++++++++++++
 5 files changed, 697 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst
 create mode 100644 Documentation/translations/pt_BR/process/researcher-guidelines.rst
 create mode 100644 Documentation/translations/pt_BR/process/stable-kernel-rules.rst

Range-diff against v1:
1:  3f9bdd755 ! 1:  498f9fa62 docs: translations: pt_BR: process: add driver_development_debugging_guide
    @@ Metadata
      ## Commit message ##
         docs: translations: pt_BR: process: add driver_development_debugging_guide
     
    -    Translate driver_development_debugging_guide and add to debugging/index.rst.
    +    Translate the driver debugging guide and update debugging/index.rst.
     
         Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
     
    @@ Documentation/translations/pt_BR/process/debugging/driver_development_debugging_
     +no log do kernel nem adiciona rastros ao código. Em vez disso, permite que o
     +desenvolvedor gerencie um conjunto de arquivos.
     +Com esses arquivos, é possível armazenar valores de variáveis ou gerar
    -+dumps de registros/memória, ou ainda tornar esses arquivos graváveis e modificar
    ++dumps de registradores/memória, ou ainda tornar esses arquivos graváveis e modificar
     +valores/configurações no driver.
     +
     +Possíveis casos de uso, entre outros:
     +
    -+- Armazenar valores de registros
    ++- Armazenar valores de registradores
     +- Acompanhar variáveis
     +- Armazenar erros
     +- Armazenar configurações
2:  d262b5c50 = 2:  588e080a3 docs: translations: pt_BR: process: Translate researcher-guidelines.rst
3:  ee88fc5b7 ! 3:  314ef8529 docs: translations: pt_BR: Translate stable-kernel-rules.rst
    @@ Documentation/translations/pt_BR/process/stable-kernel-rules.rst (new)
     +- Não pode ter mais de 100 linhas, incluindo o contexto.
     +- Deve seguir as regras de
     +  :ref:`Documentation/translations/pt_BR/process/submitting-patches.rst
    -+  <submittingpatches>`.
    ++  <pt_BR_submittingpatches>`.
     +- Deve corrigir um erro real que afete as pessoas ou apenas adicionar um ID
     +  de dispositivo. Em mais detalhes, o primeiro caso inclui:
     +
    @@ Documentation/translations/pt_BR/process/stable-kernel-rules.rst (new)
     +   Correções de segurança não devem ser tratadas exclusivamente pelo
     +   processo de revisão -stable; devem seguir os procedimentos em
     +   :ref:`Documentation/translations/pt_BR/process/security-bugs.rst
    -+   <securitybugs>`.
    ++   <pt_BR_securitybugs>`.
     +
     +Há três opções para enviar uma alteração às árvores -stable:
     +
-- 
2.55.0

