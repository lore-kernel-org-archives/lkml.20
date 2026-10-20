Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792458304;
	b=337KJtkZedegcKMrd/9X7dp6ixV5ahcn45yE5Zhyphc2g12YXRla/iO9RSG0ttXOx+wo
	 q8LwUqhz3Y7iQ5O0XNjZJNttB8bweH6NFNjgNY3wpD5EgJu4brmNFX//6Vo9K7pQ8fpPf
	 9ZVI9qPXyXvNVYPK7ncH8su0czDVS69FfQQPvPQ9PRFtgjAtUr9GNGCCR4b0tLpXaZN/2
	 YcC+HlwAY1/mrui9yvYppD6xxnQ8U22MwblGQEw0jZuCMHarP2dqHXd8xyYAiazPKRA1L
	 5Uyr8OjVRNHY5JOJKe3WkloRN9nCLaFF0b7ULH2q5uUAW1RD6UPv7NKFM4VREyMIogA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792458304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=beCaAIm6KjPKoU5CC5+6VKfEwLLAjcMEq/Osa7f8wq0=;
	b=dJpMl0AaE6/pk1C9f/Ov6j6e3V8aI9+iHvt6+0KNkUkyERNgQUuH4xw2yV4gOHezuWgn
	 FB3bpmsoembFmwbmnBtUvkyjzaVHAVn0V2ipDDWGrkGiwFWlvmp0RGyKSc6dPPAjavpUv
	 Ym1QEIjAZ5zMwIW8QZX2OrQCtDdVOGLsPAuiUBtpPvcyZ3No1Ps0vh4qKGO3e23MWRGg0
	 /+vwTrlqINEobqrHlWDMni4Q9KvnDi3od3I9XwYbEUQk18PSpdMio+JVxImtGlo++CtAI
	 P5WOpk5GaE5XjaTjg0tbiqi6DJ4ZDYlCSAIZdBF1UQAbVJwPfWENSkPWTOfWXMYWD9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MJIhDwyC;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E854F606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E854F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MJIhDwyC
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-188406bb948so245392c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792458302; x=1793063102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=beCaAIm6KjPKoU5CC5+6VKfEwLLAjcMEq/Osa7f8wq0=;
        b=MJIhDwyCSQh41J8pvvcRKgILookWmNiX5K7SCR9IjEhVSAWdg8vSA9bYu6IBtXy5u1
         uRwXhAYLk8u8TPMzGljZnXOiY3RcDNmWZ1+8IKAjUA3bL5DsHZfiaSwlCDlXaQzOtQ/Y
         yCyTMZGDhcJsTfJa2cYsfGqRqtIr3noKyN7CQ8ksoQwtTXz9sBQ/MqNohAWxheYoXFsI
         kc1xQAQt7LLCP5MF2GOuY2KI2Q4+rdb0maIomxuxR+/3a1Fp6/3O7j1ErhbAUVTl3s5Z
         mjvW3TIlMyyjlUJjxdfgQF3906P/DRW9lsbjyG/NNqVxsTEMrWQ2Xjssehj8u1MPFvEn
         /e/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792458302; x=1793063102;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=beCaAIm6KjPKoU5CC5+6VKfEwLLAjcMEq/Osa7f8wq0=;
        b=Tc6P+4o9GezTAtqQvn3Dt7rFKjHn4SJEVWOeS5Q/SfIwXh8FJanFm6wPHZ9mPbTfH8
         xvXH4qr5N3NjnEzDJjfhtrlArk/M9N8Mpwbo4bOdOJwcL768ci99QQCDoj5Tmw9yaTNX
         S1o35jenBvihWNkPfaVT36K8fzwm/1Kqi/RNCsnjSSdx+nqgW3lbVC+glpwAIuFyRxMm
         PhlmRyTWjP6QRdlYxK5RhdK179rE5UMU/yoB5P/MbINeZi4cvBl5R+KHtBSnwrkQnw6E
         x2QIOVvpqXgwSJDAY3EIl0KlvR2ow0PcOtD0s4aSeMcTKEq0Qqux/ZgXgD6a5VdzwJlV
         GjrQ==
X-Forwarded-Encrypted: i=1; AKwUvBybT9JgtQjwzpKlrj6vtltOkVH4+FY6qp0b+bSaNpSbJzXAwsmJoOg3PBW8zdWRqoBdLs7BfCwtj5kryOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/dSWNJNQAPttK7wyznTgOdVNm8re6MYX0ax8uJtwTETdnk6Ig
	wRU9lXVbey8Oy8EK718CpUDSgx5w0jBXZ/XG49tNhtfSBaOIJs/5FQnw
X-Gm-Gg: AYBFou0OVTj9NMXYQhv3ZU9DOSIDIZVsIZavpEM+xmrd0tOpVE5tA8uO0NsIayYmuNR
	3OsB0BHK/oycfh4n4gRlzez0aOIAf3h+So9fgoMlByJ4qGSr+qXia4foZNyygDjvYIrqauNpKUb
	uDMTqU9CfnIvNJatzVXBY9VeKBiCr+8O/WuH7AYxBniJK+VLDhDD3X5ZaRkek3OvEj01fThKoOT
	RUtaIExz0ssMbpbi8rrMFBnVmVYhznXKcba1xHFBksX+p2MjXac7u5rQFlDHI2w+zOvsAgSzrTW
	9vJb1kmStYhdmoySuko+gr7dhhaV+xHnmsHl0ZbPL8j4ZiD+EiTE+Uy8SzZDpcFcC1dMtmENOPY
	yER7GxrjhbgBjfqdSOJRmDGbCIeh0QOlLT1Ud6jfl5wbrTFTINTp6JnZy2nJmM00exVfdc4MKGL
	iEZuCO34qLUx6INdcUmJ7pMqsK/oOEBY/NL609vG3HuWycRc6DNUxLx+3oORpLdRReV3LdTnoY6
	QbPxv2aEon8n/hKafaGZA60AQdG0pG1ZL0QmRvl
X-Received: by 2002:a05:701b:4510:10b0:144:fb87:5b91 with SMTP id a92af1059eb24-18513e80de6mr12766319c88.44.1792458301614;
        Mon, 19 Oct 2026 18:05:01 -0700 (PDT)
Received: from dell-pro-plus ([200.9.24.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm31766147c88.18.2026.10.19.18.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:05:01 -0700 (PDT)
From: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
To: danielmaraboo@gmail.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	randy@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: translate programming-language.rst
Date: Mon, 19 Oct 2026 22:04:21 -0300
Message-ID: <20261020010421.77388-1-ic.gabrielribeiro@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
---
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
index 000000000..28a58b780
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/programming-language.rst
@@ -0,0 +1,64 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _programming_language:
+
+Linguagem de programação
+========================
+
+O kernel Linux é escrito na linguagem de programação C [c-language]_.
+Mais precisamente, o kernel costuma ser compilado com ``gcc`` [gcc]_
+usando ``-std=gnu11`` [gcc-c-dialect-options]_, que seleciona o dialeto
+GNU do padrão ISO C11. ``clang`` [clang]_ também é suportado; consulte
+a documentação sobre
+:ref:`Compilando o Linux com Clang/LLVM <kbuild_llvm>`.
+
+Esse dialeto contém muitas extensões à linguagem [gnu-extensions]_,
+muitas das quais são usadas rotineiramente no kernel.
+
+Atributos
+----------
+
+Os atributos [gcc-attribute-syntax]_ estão entre as extensões mais
+comuns usadas em todo o kernel. Eles permitem introduzir semântica
+definida pela implementação em entidades da linguagem (como variáveis,
+funções ou tipos), sem exigir mudanças sintáticas significativas
+na linguagem (por exemplo, a adição de uma nova palavra-chave) [n2049]_.
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
+O kernel oferece suporte à linguagem de programação Rust [rust-language]_
+quando a opção ``CONFIG_RUST`` está habilitada. O código Rust é compilado
+com ``rustc`` [rustc]_ usando ``--edition=2021`` [rust-editions]_. As
+edições permitem introduzir pequenas mudanças na linguagem que não são
+compatíveis com versões anteriores.
+
+Além disso, alguns recursos instáveis [rust-unstable-features]_ são usados
+no kernel. Esses recursos podem mudar no futuro; portanto, é importante
+chegar a um ponto em que apenas recursos estáveis sejam usados.
+
+Consulte Documentation/rust/index.rst para mais informações.
+
+.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
+.. [gcc] https://gcc.gnu.org
+.. [clang] https://clang.llvm.org
+.. [gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html
+.. [gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
+.. [gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html
+.. [n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
+.. [rust-language] https://www.rust-lang.org
+.. [rustc] https://doc.rust-lang.org/rustc/
+.. [rust-editions] https://doc.rust-lang.org/edition-guide/editions/
+.. [rust-unstable-features] https://github.com/Rust-for-Linux/linux/issues/2
-- 
2.56.0

