Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684155;
	b=HtWz7rFYia2xel8nxWpSWnQFvS49qsznrikWUbEw9f3RR4XVBv/hqxFqRJHimDo9FcsG
	 sCX2ZRDSvz4IMobH/QBqv8MrgIJm3THWormdE6GiJjuSj9amDDz4sH17DvO4y9PHDXGrX
	 BGG/VCnWIA1ZAnnz0LpB1IQLGxGuUg7dyQ3hP7Tvidl2CIZvynmy8nvtDhvmx8L4u2v0k
	 8zu6zmse2U19aZYP/lqz9GPIh8X1HQJPIVaANXQ9zhya/H2e/gm1MAD0shC9iFWnBymw0
	 x8JFFBVwGvnq8WWAo7MxEw31JRHFEehymGnXj+4G5LT6a7kusYZx+u5Z7/DA1oVpDuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z799PBwungCQk38WE1W1PhL2le/uFNC4uKYWvL5bioM=;
	b=0uTdw1RKCHYL1e6P8jri0FbHx5hUQe/QZ4IBVtITsqsBE16NpIOm5ArngGyaJkUdmMdw
	 1pK1Ta925hzoo/Pj04kQIc60BVBNBZXH7OZPoM6B6SDZimFeWJL4KXgkRm6khJdw6JTyT
	 WShF1sQGnluqUO9hepTeP0E7qa7mwfQLN1wzUI1Qjdyz2N6nZ8H7AXZcfCt4+QxpCxF4R
	 rF9pUNcrztShGC8eRHsdhUiRacbJDjrBIHWiSWE1YmxVcNJaBokdBDiFd6FwVLj7O8+bK
	 NZbFsg/IPEmqbTWFf68sapjyRtal1wkzzDyj+2susPUONOWcSuejbf9PSU3LXP9gTPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q0Tt3szP;
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D29606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D29606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q0Tt3szP
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so919252241.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792684154; x=1793288954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z799PBwungCQk38WE1W1PhL2le/uFNC4uKYWvL5bioM=;
        b=q0Tt3szPux3DPgEwJgq01tYB/z8hz5Z5comc5z2elERV9q0dif4r4otQOjmB8FxX4Q
         C/0RwLD9bL02aVie4BHo/7QA7IzAm5qP451LvM2HE1M2c+RuQqpjz/3CuAjREQcXlE78
         6EUNrWv/tC11fJwE0CMLxLFCMbjo9OZ6y4D0+7+dUkYLcaCvhF3JnulPQcUNib6CHjsh
         jBhJThUO9nHzSZEIfZ/a7GdEi7etW8YNnK3jQTq2iZBq8Z81rPh5NS53om8CnvCBCGe4
         TxwkdK3gtWJKBNclLwuRBYJsVTpi5RVzkyfGY1PRrRG+fFnB05KjBX2BeWFyMuuFzVBu
         XM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684154; x=1793288954;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z799PBwungCQk38WE1W1PhL2le/uFNC4uKYWvL5bioM=;
        b=x1cyfxbxD0NysY+39r9pu9UMcz0U7Z8JwSwvjGacRPnnOmJPMOrKu1PzwR0c0VxVSI
         N3XBlvY9QWk3KrDlB/dY5VtLv9NSIml2RIRmOgsbOiPD1gNvicgdxR8fttZ7vlp0Wfxb
         Mq4i2X70QubWK/IBRFCKJ6xkAqPD8NQFzsWgTQRMJkpqHqvh7AeBSNPc1s0sQmy38Rji
         0dEzJf/PVns9oFTSpxecTSbuNK9xYArs3HLKj+3MdD5q4c3dL7Mg54cRcKuwyEooUrx5
         hYhJP1N52r5q2Zu+GMQqLS8G5PFEJhUcmZ4hzuRXZzbDfn6aP8eHNerHo5YYgQl6ibLn
         7iBQ==
X-Forwarded-Encrypted: i=1; AKwUvByrPmcvYdskf9LHj7Lr6oOzXbQg1/SLKHXd+/KTZLSfl/bMJwe3W+c7VRGl5sUtInbeaF00bIMwkavfXYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBjUmNB597WIbcf2O9MNpYy0JTaAq2s+f1EWGaQSnDXztG+9IY
	L6XbD0zkUZtGPf/V9pT4mzCVX7FPTiHJGY1c4WmRKQ2RTV/U0aBlLCAz
X-Gm-Gg: AYBFou0es8f2Kc9y999GxZFZjR6mIZi5j6Zqm9ydwy7jhhvTStM6xiroHGd4VmmkvhF
	LFuX54KXIctJmpfQiye8A1tB7gAN8X42Jszsv01e1lUi0qbn4Q8wADu5ZXY0tgosMpC1y8O7vTc
	JProtN7JcG97KNf34Fl0AWv0Js5Y8XIuQBGFmiLRyMPFpLsEzbvTSXD6KaXKhpuhG+EUScU2jPW
	daW6Uxv9HFuvo5XrbDcR3EI7vr4tfMo5x4KZoRwDgsxKYrn4X+5EU7rVshu2IgkQqcv0qfttdCJ
	ASpZve+enSNm3rtQgSOERHXhzfGiToU3Qb3Eub9dZ7S0y48H7IliLhH4myPdRaXPSZPrdJz1QqF
	6AnIGjB23/tb/4S4vutSZo/YgUbzBx5gzaK8ehfFFNuT55ghJY26MP9oNf1fumXhAd6K8KPDY0u
	ATJsT8GrxP/qMxTeIgML4AxgyErvMFqzOQl2Psmz7hpa/aA6M6BWJWBnupoP6UJFI61g0S7VkHm
	Xa1SXgxOMXn4rInw9ITTFYYshjPq2/9JjjJgreYGMVVaZRMBhIi6VlfJJxxR58titfxRr4iYOL4
	sZMDOf/dLy16aX0TUm8FLE6PA2EdUd3Sh152zV6iBHP2j83pTA==
X-Received: by 2002:a05:6102:1a1a:b0:7ba:95f3:8a07 with SMTP id ada2fe7eead31-7cca98139c9mr569745137.13.1792684153876;
        Thu, 22 Oct 2026 08:49:13 -0700 (PDT)
Received: from dell-pro-plus ([2804:29b8:5080:dd51:d55c:b555:e096:bdc4])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ccc2187b03sm21781137.10.2026.10.22.08.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:49:13 -0700 (PDT)
From: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
To: danielmaraboo@gmail.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
Subject: [PATCH v2] docs: translations: pt_BR: translate programming-language.rst
Date: Thu, 22 Oct 2026 12:48:40 -0300
Message-ID: <20261022154840.119951-1-ic.gabrielribeiro@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Translate the programming language guide and link it from the pt_BR
process index.

Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
---
Changes in v2:
- Use translation-specific labels for the page and all citations.
- Drop the obsolete Assisted-by trailer.

 .../translations/pt_BR/process/index.rst      |  1 +
 .../pt_BR/process/programming-language.rst    | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/programming-language.rst

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index d072f7e46..ccfe86de2 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -39,6 +39,7 @@ devem estar familiarizados.
    :maxdepth: 1
 
    Requisitos mínimos <changes>
+   Linguagem de programação <programming-language>
    Estilo de codificação do kernel Linux <coding-style>
    Informações sobre clientes de email para Linux <email-clients>
    Como aplicar patches <applying-patches>
diff --git a/Documentation/translations/pt_BR/process/programming-language.rst b/Documentation/translations/pt_BR/process/programming-language.rst
new file mode 100644
index 000000000..91fc1a553
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/programming-language.rst
@@ -0,0 +1,64 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _pt_BR_programming_language:
+
+Linguagem de programação
+========================
+
+O kernel Linux é escrito na linguagem de programação C [pt-c-language]_.
+Mais precisamente, o kernel costuma ser compilado com ``gcc`` [pt-gcc]_
+usando ``-std=gnu11`` [pt-gcc-c-dialect-options]_, que seleciona o dialeto
+GNU do padrão ISO C11. ``clang`` [pt-clang]_ também é suportado; consulte
+a documentação sobre
+:ref:`Compilando o Linux com Clang/LLVM <kbuild_llvm>`.
+
+Esse dialeto contém muitas extensões à linguagem [pt-gnu-extensions]_,
+muitas das quais são usadas rotineiramente no kernel.
+
+Atributos
+----------
+
+Os atributos [pt-gcc-attribute-syntax]_ estão entre as extensões mais
+comuns usadas em todo o kernel. Eles permitem introduzir semântica
+definida pela implementação em entidades da linguagem (como variáveis,
+funções ou tipos), sem exigir mudanças sintáticas significativas
+na linguagem (por exemplo, a adição de uma nova palavra-chave) [pt-n2049]_.
+
+Em alguns casos, os atributos são opcionais (isto é, um compilador que
+não os suporte ainda deve gerar código correto, mesmo que o programa
+resultante seja mais lento ou o compilador realize menos verificações e
+diagnósticos em tempo de compilação).
+
+O kernel define pseudopalavras-chave (por exemplo, ``__pure``) em vez de
+usar diretamente a sintaxe de atributos do GNU (por exemplo,
+``__attribute__((__pure__))``), para detectar quais atributos são
+suportados e/ou encurtar o código.
+
+Consulte ``include/linux/compiler_attributes.h`` para mais informações.
+
+Rust
+----
+
+O kernel oferece suporte à linguagem de programação Rust [pt-rust-language]_
+quando a opção ``CONFIG_RUST`` está habilitada. O código Rust é compilado
+com ``rustc`` [pt-rustc]_ usando ``--edition=2021`` [pt-rust-editions]_. As
+edições permitem introduzir pequenas mudanças na linguagem que não são
+compatíveis com versões anteriores.
+
+Além disso, alguns recursos instáveis [pt-rust-unstable-features]_ são usados
+no kernel. Esses recursos podem mudar no futuro; portanto, é importante
+chegar a um ponto em que apenas recursos estáveis sejam usados.
+
+Consulte Documentation/rust/index.rst para mais informações.
+
+.. [pt-c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
+.. [pt-gcc] https://gcc.gnu.org
+.. [pt-clang] https://clang.llvm.org
+.. [pt-gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html
+.. [pt-gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
+.. [pt-gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html
+.. [pt-n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
+.. [pt-rust-language] https://www.rust-lang.org
+.. [pt-rustc] https://doc.rust-lang.org/rustc/
+.. [pt-rust-editions] https://doc.rust-lang.org/edition-guide/editions/
+.. [pt-rust-unstable-features] https://github.com/Rust-for-Linux/linux/issues/2
-- 
2.56.0

