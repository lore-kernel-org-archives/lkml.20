Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792469653;
	b=CBjidw4JDc8ZLE05yYe3p4V29jzXFCfu3/cQX/G/i0C0MpnJHQ/WpdcTe7qixqxwOoGd
	 t0DQn1LNWoOnqMGbSWSj4G6EspEl36V1byXFg0zRRZqFFmtYp4PG4azlsWf1PAjxG7HEi
	 ygU1g3luwzHFFY03TdgCetM3r9NfwRqjhP4T9PozxNyB4vfxM7l25GLmuTCd5C6IBhtlf
	 mGLYwyaixJwkw783Uq+zJnIywUeOBWoMVxe0No0l3UP0VNjOS0Bpk4QzuDbJD6sfBZQDs
	 SoJNpEAguIiy2sa0HljpuzpuCNDZLTXs9uOXetTEn47mli1/1ZqOFmNAIvJXH7xQJJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792469653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6qxPO83MwstX+FjXhsjKFpIDrm4MWUPHITZsYJi7m8s=;
	b=HOs03gVKAWIv9J44P1HXgcFiN1CqpxcprGrMqnjjT4yXkMDexdMb+lCszWmO7xwpVVV6
	 K0Vkx3GDYM4DaeXRAB3jOLxGRoqZn1bIA49XbZm33+G+GclwCr/+F8YngG30Lx9Jq1sdm
	 O0Pr/ScOtmuKwqospfsfy2TKqhWDYilcjPhfXtCu6h8StTHO3gIcqCIGMvr1cyrmO4gk9
	 yfEAmXrCzEDmMKfTdFFpjXYaZc1fjtTzVDtwhGa0BnWpzMeZgM2pbBljmiaWBk+w32Ct3
	 80vCthCSzVLVN1Jb8sTJSVUZyypp2KbHUZjubBAtmgbMidVrMNBwuKDHBU5UjyKZO4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BGk+haZa;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293E4606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 293E4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BGk+haZa
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35ef6b49813so5280792eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792469652; x=1793074452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6qxPO83MwstX+FjXhsjKFpIDrm4MWUPHITZsYJi7m8s=;
        b=BGk+haZaY97myaC6uSU11n3qvvvCFMYV7WE98KKkqAgHtAM65XQu6vtcxT9c3skJ1r
         aY/xgD/0i5VHtWUwwApJugGCo6UUASRqfP4Ze+peGxXkz6Vn5aPmiS4pSuYpTMRewAb3
         2VB7sHp429EvIhhsRdx2IUNZlBHswtCFiPkYQViExxIfGVXhAk5ND4pz/be4hTMdmHzZ
         sGlS/earsMHpOKIL0P2LGpE+c9PdeUHudjJL/vnA5VQzVL1flHxID4Lnr+MA7kOuf+BC
         MfqYpvaRzQ4/yWnMo92+leDXJnrB6Uh2+OAzM74En/dEzLYQc+KB5WxhNE1h4S8fLKep
         o9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792469652; x=1793074452;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qxPO83MwstX+FjXhsjKFpIDrm4MWUPHITZsYJi7m8s=;
        b=Lvai8uqUuQfWHugCfQsTI+UjsBjxGTFl7sByrwf8rsr4fpTecNL1SeAf7mzplkzdTF
         adQoUMvB2W7DFoEpn2lq0a/dvExK3GJoSjSLKdAk/yWJx8SJau/0VZPDngEyH0qhnkrS
         erlSZLoRV2M4LUxpk+LaLRQWKsDTNXrAFZAgSwTj2zeasWL54Owl0wi4V72fvraoTI4A
         YQGimOuD7eL5MqQvnxXqUvtbIIo1Jhjycw2JxtQmToLTCEE0RHo9HkTrTVbiQ5XWjnGY
         fAJb3+/8Jw5Um+cgjJmEKH/G5EvvdFTU3GMbd1TabGyaJFLjXaTUtvF76PDAKTfd2LZJ
         CT9Q==
X-Forwarded-Encrypted: i=1; AKwUvByZroQCidN5qpLVGU14PejdRP3/qN9MLCGImrgGuDKPep3B5Ul5LRul444xvtoxDjKrnh9cZfl6LmADt1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzsIQ/0OJ1xMxaXnUBHmMh4mpHkaWGeM2H3Z/mL6thQbBjIsOc
	Tz26KPUP1G9rAcooxAgnqs6EYrrhb7cZvJ1zVT24k9W0iHFuwLKyogGx
X-Gm-Gg: AYBFou1d7vYr2yWi294TmAkkW+ClQrvyrQrSL76TGPuxcpgSLxWneqzkCI5gGdYxREk
	XoUwXuVq/d7JtEaF5BZvwzFsNkmqPAmXTV/rYhV9Pr+qe24gUpck8g6om6qPvYNvXOviOzxRK2F
	J32FzBv3i/463qIQ/svwiLKVgipdNgZzhvrjUbK+5OT5tRpHDrL20wPYwMWrxR0GmO/nAYkMLzb
	8F1G/daKfg+y63YjmLhYnI7mJNB8dVdTbMs9gTjpmGvDxhhxUBNM+/eKmKb71YCJnZ7bRi+2LwL
	UVxmWhYIB6O+pqvVUqeMJ0+AF2G4R4EFBdVyAyooL5RM2Yl4cry5qIuxv+6eXhvqC6mq9bA55/Z
	pY7eEvsBlr5jf4vg28dMGO09Id4VCk5mFS65+bi9i+A7+mcO0sfG1qvDOsG4S4kZ8QgH5K5Youw
	KpwekWuWcM0cQZAec68nYNQFUuVjocQVG8DX09eQsdqGBc0qMXpAi9znLDnYfh5DWSyd+3jc0+X
	ZQ=
X-Received: by 2002:a05:7301:430c:b0:358:8f02:e0ca with SMTP id 5a478bee46e88-361a1668b25mr13231785eec.9.1792469652048;
        Mon, 19 Oct 2026 21:14:12 -0700 (PDT)
Received: from fedora ([2804:29b8:508d:af45:a398:9dc5:b37c:dfa8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm38861428eec.21.2026.10.19.21.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 21:14:11 -0700 (PDT)
From: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
To: danielmaraboo@gmail.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Subject: [PATCH v2 3/3] docs: translations: pt_BR: Translate stable-kernel-rules.rst
Date: Tue, 20 Oct 2026 01:13:38 -0300
Message-ID: <20261020041340.447727-4-lucasadramalho@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020041340.447727-1-lucasadramalho@gmail.com>
References: <cover.1791933697.git.lucasadramalho@gmail.com>
 <20261020041340.447727-1-lucasadramalho@gmail.com>
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

Translate the stable kernel rules documentation into Brazilian Portuguese.

Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
---
 .../translations/pt_BR/process/index.rst      |   1 +
 .../pt_BR/process/stable-kernel-rules.rst     | 258 ++++++++++++++++++
 2 files changed, 259 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/stable-kernel-rules.rst

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index 31704e28d..29f6c7735 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -63,6 +63,7 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Declaração de Aplicação do Kernel Linux <kernel-enforcement-statement>
    Declaração sobre Drivers do Kernel <kernel-driver-statement>
    A interface de drivers do kernel Linux <stable-api-nonsense>
+   Tudo o que você sempre quis saber sobre as versões estáveis do Linux <stable-kernel-rules>
    Estilo de gerenciamento do kernel Linux <management-style>
    Diretrizes para pesquisadores <researcher-guidelines>
    Assistentes de código <coding-assistants>
diff --git a/Documentation/translations/pt_BR/process/stable-kernel-rules.rst b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
new file mode 100644
index 000000000..201c87150
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
@@ -0,0 +1,258 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _pt_BR_stable_kernel_rules:
+
+Tudo o que você sempre quis saber sobre as versões estáveis do Linux
+====================================================================
+
+Regras sobre quais tipos de correções são aceitos na árvore "-stable" e
+quais não são:
+
+- A correção, ou uma equivalente, já deve existir na linha principal do
+  Linux (upstream).
+- Deve estar obviamente correta e ter sido testada.
+- Não pode ter mais de 100 linhas, incluindo o contexto.
+- Deve seguir as regras de
+  :ref:`Documentation/translations/pt_BR/process/submitting-patches.rst
+  <pt_BR_submittingpatches>`.
+- Deve corrigir um erro real que afete as pessoas ou apenas adicionar um ID
+  de dispositivo. Em mais detalhes, o primeiro caso inclui:
+
+  - Corrigir um problema como um oops, travamento, corrupção de dados,
+    problema real de segurança, peculiaridade de hardware, erro de
+    compilação (exceto itens CONFIG_BROKEN) ou algum problema do tipo "isso
+    não é nada bom".
+  - Problemas graves relatados por usuários de um kernel de distribuição
+    também podem ser considerados se as correções resolverem um problema
+    notável de desempenho ou interatividade. Como essas correções não são
+    tão óbvias e apresentam maior risco de causar uma regressão sutil, elas
+    só devem ser enviadas pelo mantenedor do kernel da distribuição e
+    devem incluir um complemento com um link para uma entrada no Bugzilla,
+    se houver, e informações adicionais sobre o impacto percebido pelo
+    usuário.
+  - Não são aceitos problemas do tipo "isto pode ser um problema...", como
+    uma "condição de corrida teórica", a menos que também seja fornecida
+    uma explicação de como o erro pode ser explorado.
+  - Não são aceitas correções "triviais" sem benefício para os usuários
+    (alterações ortográficas, limpeza de espaços em branco etc.).
+
+
+Procedimento para enviar correções à árvore -stable
+----------------------------------------------------
+
+.. note::
+
+   Correções de segurança não devem ser tratadas exclusivamente pelo
+   processo de revisão -stable; devem seguir os procedimentos em
+   :ref:`Documentation/translations/pt_BR/process/security-bugs.rst
+   <pt_BR_securitybugs>`.
+
+Há três opções para enviar uma alteração às árvores -stable:
+
+1. Adicionar uma "stable tag" à descrição de uma correção que será enviada
+   para inclusão na linha principal.
+2. Pedir à equipe stable que inclua uma correção já integrada à linha
+   principal.
+3. Enviar à equipe stable uma correção equivalente a uma alteração já
+   integrada à linha principal.
+
+As seções abaixo descrevem cada opção em mais detalhes.
+
+A :ref:`pt_BR_option_1` é **fortemente** preferida; é a opção mais fácil e
+mais comum.
+A :ref:`pt_BR_option_2` destina-se principalmente a alterações para as
+quais o backport não foi considerado no momento do envio.
+A :ref:`pt_BR_option_3` é uma alternativa às opções anteriores quando uma
+correção integrada à linha principal precisa de ajustes para ser aplicada
+a séries mais antigas (por exemplo, devido a alterações na API).
+
+Ao usar a opção 2 ou 3, você pode pedir que sua alteração seja incluída em
+séries stable específicas. Nesse caso, certifique-se de que a correção ou
+uma equivalente seja aplicável, tenha sido enviada ou já esteja presente em
+todas as árvores stable mais novas que ainda recebem suporte. Isso evita
+regressões que os usuários poderiam encontrar ao atualizar. Por exemplo,
+uma correção integrada para 5.19-rc1 poderia ser portada para
+5.10.y, mas não para 5.15.y.
+
+.. _pt_BR_option_1:
+
+Opção 1
+*******
+
+Para que uma correção enviada para inclusão na linha principal seja
+selecionada automaticamente depois pelas árvores stable, adicione esta
+etiqueta à seção de assinaturas (sign-off)::
+
+  Cc: stable@vger.kernel.org
+
+Use ``Cc: stable@kernel.org`` em vez disso ao corrigir vulnerabilidades
+ainda não divulgadas: isso reduz a chance de expor acidentalmente a
+correção ao público por meio do 'git send-email', pois as mensagens
+enviadas a esse endereço não são entregues.
+
+Depois que a correção for integrada à linha principal, ela será aplicada à
+árvore stable sem que o autor ou o mantenedor do subsistema precise fazer
+mais nada.
+
+Para enviar instruções adicionais à equipe stable, use um comentário em
+linha no estilo do shell para passar observações arbitrárias ou
+predefinidas:
+
+* Especifique pré-requisitos adicionais para a seleção por cherry-pick::
+
+    Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
+    Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
+    Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
+    Cc: <stable@vger.kernel.org> # 3.3.x
+    Signed-off-by: Ingo Molnar <mingo@elte.hu>
+
+  A sequência de etiquetas indica que se deve executar::
+
+    git cherry-pick a1f84a3
+    git cherry-pick 1b9508f
+    git cherry-pick fd21073
+    git cherry-pick <this commit>
+
+  Observe que, em uma série de correções, não é necessário listar como
+  pré-requisitos as correções que fazem parte da própria série. Por
+  exemplo, nesta série::
+
+    patch1
+    patch2
+
+  patch2 depende de patch1, mas não é necessário listar patch1 como
+  pré-requisito de patch2 se você já tiver marcado patch1 para inclusão no
+  stable.
+
+* Indique os pré-requisitos de versão do kernel::
+
+    Cc: <stable@vger.kernel.org> # 3.3.x
+
+  A etiqueta indica que se deve executar::
+
+    git cherry-pick <this commit>
+
+  em cada árvore -stable a partir da versão especificada.
+
+  Observe que essa etiqueta é desnecessária se a equipe stable puder
+  deduzir as versões apropriadas a partir das etiquetas Fixes:.
+
+* Adiar a inclusão de correções::
+
+    Cc: <stable@vger.kernel.org> # after -rc3
+
+* Aponte problemas conhecidos::
+
+    Cc: <stable@vger.kernel.org> # see patch description, needs adjustments for <= 6.3
+
+Também há uma variante da etiqueta stable que pode ser usada para fazer com
+que as ferramentas de backport da equipe stable (por exemplo, AUTOSEL ou
+scripts que procuram commits com uma etiqueta 'Fixes:') ignorem uma
+alteração::
+
+     Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present
+
+.. _pt_BR_option_2:
+
+Opção 2
+*******
+
+Se a correção já tiver sido integrada à linha principal, envie um e-mail
+para stable@vger.kernel.org com o assunto da correção, o ID do commit, o
+motivo pelo qual você acredita que ela deve ser aplicada e as versões do
+kernel às quais deve ser aplicada.
+
+.. _pt_BR_option_3:
+
+Opção 3
+*******
+
+Depois de verificar que a correção segue as regras acima, envie-a para
+stable@vger.kernel.org e indique as versões do kernel às quais deseja que
+ela seja aplicada. Nesse caso, você deve indicar o ID do commit upstream no
+registro de alterações do envio, em uma linha separada acima do texto do
+commit, assim::
+
+  commit <sha1> upstream.
+
+Ou, alternativamente::
+
+  [ Upstream commit <sha1> ]
+
+Se a correção enviada diferir da correção upstream original (por exemplo,
+porque precisou ser adaptada à API mais antiga), isso deve ser documentado
+e justificado com muita clareza na descrição da correção.
+
+
+Acompanhamento do envio
+-----------------------
+
+O remetente receberá um ACK quando a correção for aceita na fila, ou um NAK
+se for rejeitada. Essa resposta pode levar alguns dias, dependendo da
+disponibilidade dos membros da equipe stable.
+
+Se for aceita, a correção será adicionada à fila -stable para revisão por
+outros desenvolvedores e pelo mantenedor do subsistema relevante.
+
+
+Ciclo de revisão
+----------------
+
+- Quando os mantenedores -stable decidirem iniciar um ciclo de revisão, as
+  correções serão enviadas ao comitê de revisão, ao mantenedor da área
+  afetada pela correção (a menos que o remetente seja o mantenedor dessa
+  área) e em cópia (CC:) para a lista de discussão linux-kernel.
+- O comitê de revisão tem 48 horas para aprovar (ACK) ou rejeitar (NAK) a
+  correção.
+- Se um membro do comitê rejeitar a correção ou membros da lista
+  linux-kernel apresentarem objeções levantando problemas que os
+  mantenedores e os membros não perceberam, a correção será removida da
+  fila.
+- As correções aprovadas serão publicadas novamente como parte de uma
+  versão candidata (-rc), para serem testadas por desenvolvedores e
+  testadores.
+- Geralmente é publicada apenas uma versão -rc. No entanto, se houver
+  problemas pendentes, algumas correções poderão ser modificadas ou
+  removidas, ou outras poderão ser adicionadas à fila. Nesse caso, versões
+  -rc adicionais serão publicadas e testadas até que nenhum problema seja
+  encontrado.
+- É possível responder às versões -rc na lista de discussão enviando um
+  e-mail "Tested-by:" com as informações de teste desejadas. As etiquetas
+  "Tested-by:" serão reunidas e adicionadas ao commit de lançamento.
+- Ao final do ciclo de revisão, a nova versão -stable será lançada com
+  todas as correções enfileiradas e testadas.
+- Correções de segurança serão aceitas diretamente na árvore -stable pela
+  equipe de segurança do kernel e não passarão pelo ciclo normal de
+  revisão. Entre em contato com a equipe de segurança do kernel para saber
+  mais sobre esse procedimento.
+
+
+Árvores
+-------
+
+- As filas de correções, tanto das versões concluídas quanto das versões em
+  andamento, podem ser encontradas em:
+
+    https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git
+
+- As versões finalizadas e identificadas por tags de todos os kernels
+  estáveis podem ser encontradas em ramificações separadas por versão em:
+
+    https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
+
+- As versões candidatas de todas as versões do kernel stable podem ser
+  encontradas em:
+
+    https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/
+
+  .. warning::
+     A árvore -stable-rc é um instantâneo da árvore stable-queue e muda com
+     frequência; por isso, é rebaseada frequentemente. Ela deve ser usada
+     apenas para testes (por exemplo, por sistemas de integração contínua).
+
+
+Comitê de revisão
+-----------------
+
+- É formado por vários desenvolvedores do kernel que se voluntariaram para
+  essa tarefa e por alguns que não se voluntariaram.
-- 
2.55.0

