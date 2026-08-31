Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0704403EB3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218803; cv=none; b=L2QMYVCLJbNTbJv8KNIk7eBanc8nkOp9lJTopme8cdQVdn+gQvApk/x6mHAgDYRjA1C7yVGF0aXKqAR6Xkt1aYdt8vSt2Ji8zZMGhpU4IwsdN5VJVAT/BbWERam6s+3T50TBAyEZV41+zjgcIyL/2nzkMt0ECGYCjsZuGzCj9nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218803; c=relaxed/simple;
	bh=Px3WPJsJT98G0nSOx33kV9YpzPVJGQJclye8SW8PAjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JAaVI4qCj6y2JZkNERmnMQPLq76mQgz1bwzyLS71pZ9RrHl7D3UuaDzGp06vFzPI7ZgdW/YxbmW+mm3WKChxui+8/XIKi/RtVqHnzcdLmGgWcAb6MXLWEPiE287g7TJnCEnXIuzoG3aEx1NenpfJKa8/ekTa2OM6jvT45+TGFp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdG47dVf; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdG47dVf"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-861145fc841so25958747b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788218800; x=1788823600; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e1xYo3hdqET7WwrhB0ZD0H/ZAAlDFrf1Xtb+9lQv0GM=;
        b=GdG47dVfKdrEUlBv2cOCVitDdBLOX+42o5XYqLRb8/bvyPGSsJGzWAYj/w3Lg/+B9x
         tv171E04Fx02pp4DnFeKK1tUUdS19VJAXcDN/SNTa06+bWRbj+VepB1P0ifn1qjk0B3L
         fUVxltfGfumD5OAqVCd2tClCuDwPCqZeCyxMssNQnyikKBopmSYhmK1kpR4hzQyUScVt
         3zSsW7Dz2C0kVy3yqSCbj8dWnNv6t/fG+ifXXvish9z/NcAWzqdc+3QpgczhYAnL+IW8
         ldHa6/+NLt2ACKEajB0eQuECbc58ONgEmXraw6cr2RUbyse/F09piB9m2E//rqKFc8X6
         +RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218800; x=1788823600;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e1xYo3hdqET7WwrhB0ZD0H/ZAAlDFrf1Xtb+9lQv0GM=;
        b=dv7/kLQMWJaKqSyYhEPhEhXsOo3shvj5TgVmA3tDRGW4e53DPNF06gZQ/6ZDYVhqEg
         5DnHfyetpy98LY885xxNi8jPcYWHy994czLRnk1Ogh3FIpH5grwdc4w/EIIK/7HlTVrS
         sQtDMM7U+AgTVLK14mjYxpDuN3qZcW1788HWO5sn/HmvPtjQ+SXgvk4p27Rs+z/mwQCl
         xuxu1OIBCnKtniB2Zxgyi4MeJ6TrJccliOO5tnY8DldFC67j/sDvpcYekgc4nedIxH8R
         2Gihxs5i5WQ8EpVF1ZLh1+O/Z8cLkL2NWCm5F3wYGlAfWnkSR0nlUf11A5qrtQ5WryZQ
         CbwA==
X-Forwarded-Encrypted: i=1; AKwUvBxYKoFLiEnbK8RSGtWrCVYUuauTlM5cB0gf9CTxHJRSXUhh0YE2jW/5PNspco6jzA2AmuQcO2+Z6a5dXWE=@vger.kernel.org
X-Gm-Message-State: AFuF++m8fkPZLCK7DpinJi8hpKfh4ygPl3IZLkiMz1nmtqi4DU2JFec1
	rcYddiOzWKWMMG83/cR2fJzI+sK/ZkM+OnNvIUh+22y13otMbbil3npc
X-Gm-Gg: AYBFou0JxEY8loLxWqwd95xO0rz76sVjH8dntN/9dQXWGFF/KbxUR4J8/AOtZndHoB6
	lmTOeE6Zyuj7JhOs4gno4hZld0fM/ITJS/JjIya+8o+2NOP3LowD1XbLgMY0fl1ZICiQEtMDrA6
	Rh4XVUcLEv3vqDJzJ7qJCNewMyq5zSPQxu/IlETFwo7cgRGFHX1OQymbisftv7svXEw78M7wW+V
	pv739Mp4He3RxrtJRtHY+Yjjs7ryU5Nj0s7FkQZSxcnI8riqItDlDwwnnAmvRP/l8oCBCZbW0tS
	1KU7cU4VMXvOl39cJKZcV7blIWceMVyADhs6+BTk8cejw++i21okV9UJRaVEXr7lHMY7QTeHIbB
	kCfYLSqlnU+ZrGUdJAn0Ei2SaRroVR2rQsLlJkfeEXFWUbXezTGGp0jI6nae8Equ4IZja5cvXr4
	POjVdXcyP7IP592yeWvWPwwwxZnBpo/dcrktPmZBSg0WpoINIbY21pj1smqNiul9kmZdxOT0U=
X-Received: by 2002:a05:690c:12:b0:867:617c:9907 with SMTP id 00721157ae682-86874be1e3fmr20245247b3.18.1788218800211;
        Mon, 31 Aug 2026 16:26:40 -0700 (PDT)
Received: from [10.112.196.110] ([187.9.129.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8650aacd1c7sm34291667b3.35.2026.08.31.16.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:26:39 -0700 (PDT)
From: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Date: Mon, 31 Aug 2026 20:26:30 -0300
Subject: [PATCH v4] docs: translations: pt_BR: translate
 stable-api-nonsense.rst
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260831-ptbr-stable-api-nonsense-v4-1-0ef5e58504cc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OywrCMBAF0F8pWRvJUxtX/oe4yGPSBmpbklKU0
 n83LS6qYGE2d+CemQkliAESuhQTijCGFLo2B3EokK11WwEOLmfECDuRkircDybiNGjTANZ9wG3
 XJsiDreCOCam1lwrleh/Bh+dK3+451yENXXytl0a6bD8oI//RkWKKCRfUS+nBMnetHjo0R9s90
 IKObAvRHYhlyJOz80ITb7n5hfgW4jsQz5AsrTIAxivz9dE8z2+QFM9oUgEAAA==
X-Change-ID: 20260819-ptbr-stable-api-nonsense-c43d245aaf59
To: Daniel Pereira <danielmaraboo@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lucas Adryell Ramalho <lucasadramalho@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788218796; l=14266;
 i=lucasadramalho@gmail.com; h=from:subject:message-id;
 bh=Px3WPJsJT98G0nSOx33kV9YpzPVJGQJclye8SW8PAjw=;
 b=2d90CY4hVYuV4FuZFJUeXPsH7ia1iK5c0je82P6S4UrsLYnh9FU96ADSD1tXGuSjkxVuGdsfu
 tut9rKLkmovBGm09AztKfvo3tV7r1R0Xc1thEDVHr+iAhZzShUE0IkF
X-Developer-Key: i=lucasadramalho@gmail.com; a=ed25519;
 pk=m3TQ0mH3ARCg0EdGRQWOTlBoFnDen6VWMNGjXW+W4NM=

Translate Documentation/process/stable-api-nonsense.rst into Brazilian
Portuguese.

Assisted-by: ChatGPT:GPT-5.5
Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
---
Changes in v4:
- Fix nested list formatting that caused an error during make htmldocs.
- Remove trailing whitespace reported by checkpatch.
- Link to v3: https://lore.kernel.org/r/20260823-ptbr-stable-api-nonsense-v3-1-58c9beebf9bd@gmail.com

Changes in v3:
- Remove blank lines between bullet points, as Daniel suggested, to match
  the style used in the other kernel documentation files.
- Link to v2: https://lore.kernel.org/r/20260821-ptbr-stable-api-nonsense-v2-1-f07df4a0fc3b@gmail.com

Changes in v2:
- Remove the unnecessary top-of-file label that caused a duplicate-label warning during the documentation build.
- Add disclosure for generative tools used while preparing and reviewing the translation.
- Build the documentation with make htmldocs and verify that the translated document introduces no new warnings or errors.
- Link to v1: https://lore.kernel.org/r/20260820-ptbr-stable-api-nonsense-v1-1-0341f55fec2d@gmail.com

I used ChatGPT and DeepL to help me clarify some Portuguese sentences that did not sound entirely natural or clear to me.
---
 Documentation/translations/pt_BR/process/index.rst |   1 +
 .../pt_BR/process/stable-api-nonsense.rst          | 208 +++++++++++++++++++++
 2 files changed, 209 insertions(+)

diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index eda2a3fc5..1fb2f325f 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -58,6 +58,7 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Interpretação do Código de Conduta do Kernel Linux <code-of-conduct-interpretation>
    Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model.rst>
    Declaração sobre Drivers do Kernel <kernel-driver-statement>
+   A interface de drivers do kernel Linux <stable-api-nonsense>
    Estilo de gerenciamento do kernel Linux <management-style>
    Conclave (Continuidade do projeto) <conclave>
 
diff --git a/Documentation/translations/pt_BR/process/stable-api-nonsense.rst b/Documentation/translations/pt_BR/process/stable-api-nonsense.rst
new file mode 100644
index 000000000..c5d0e643e
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/stable-api-nonsense.rst
@@ -0,0 +1,208 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+A interface de drivers do kernel Linux
+=======================================
+
+(todas as suas perguntas respondidas e mais algumas)
+
+Greg Kroah-Hartman <greg@kroah.com>
+
+Este texto foi escrito para tentar explicar por que o Linux **não possui uma
+interface binária do kernel nem uma interface estável do kernel**.
+
+.. note::
+
+   Observe que este artigo descreve as interfaces **internas do kernel**, e não
+   as interfaces entre o kernel e o espaço de usuário.
+
+   A interface entre o kernel e o espaço de usuário é aquela utilizada pelos
+   aplicativos: a interface de chamadas de sistema (syscalls). Essa
+   interface é **muito** estável ao longo do tempo e não será quebrada. Tenho
+   programas antigos, compilados em uma versão do kernel anterior à 0.9 e alguma
+   coisa, que ainda funcionam perfeitamente na versão mais recente do kernel
+   2.6. Essa é a interface cuja estabilidade os usuários e desenvolvedores de
+   aplicativos podem considerar garantida.
+
+
+Resumo executivo
+----------------
+
+Você acha que quer uma interface estável do kernel, mas, na verdade, não quer,
+e nem sabe disso. O que você realmente quer é um driver que continue
+funcionando de maneira estável, e isso só é possível se o seu driver estiver
+na árvore principal do kernel. Você também obtém muitos outros benefícios se
+o seu driver fizer parte da árvore principal do kernel. São esses benefícios
+que ajudaram a tornar o Linux um sistema operacional tão robusto, estável e
+maduro — justamente a razão pela qual você o está usando.
+
+
+Introdução
+----------
+
+Apenas quem escreve drivers para o kernel precisa se preocupar com as mudanças
+nas interfaces internas do kernel. Para a grande maioria das pessoas, essas
+interfaces nem sequer são visíveis e tampouco são motivo de preocupação.
+
+Antes de mais nada, não abordarei **nenhuma** questão jurídica relacionada a
+código-fonte fechado, código-fonte oculto, blobs binários, wrappers de
+código-fonte ou qualquer outro termo usado para descrever drivers do kernel
+cujo código-fonte não seja disponibilizado sob a GPL. Consulte um advogado
+caso tenha alguma dúvida jurídica. Sou programador e, portanto, descreverei
+aqui apenas as questões técnicas (isso não significa que as questões
+jurídicas sejam pouco importantes; elas são reais e você precisa estar sempre
+ciente delas).
+
+Portanto, há dois tópicos principais: interfaces binárias do kernel e
+interfaces estáveis de código-fonte do kernel. Ambos dependem um do outro,
+mas discutiremos primeiro a parte referente às interfaces binárias para
+deixá-la de lado.
+
+
+Interface binária do kernel
+---------------------------
+
+Supondo que tivéssemos uma interface estável de código-fonte para o kernel,
+uma interface binária surgiria naturalmente também, certo? Errado. Considere
+os seguintes fatos sobre o kernel Linux:
+
+  - Dependendo da versão do compilador C utilizada, diferentes estruturas de
+    dados do kernel terão diferentes alinhamentos e poderão até mesmo incluir
+    funções de maneiras distintas (por exemplo, tornando determinadas funções
+    inline ou não). A organização das funções individuais não é tão importante,
+    mas as diferenças no preenchimento das estruturas de dados são muito
+    importantes.
+  - Dependendo das opções selecionadas durante a compilação do kernel, uma
+    grande variedade de comportamentos pode ser assumida pelo kernel:
+
+      - diferentes estruturas podem conter campos diferentes;
+      - algumas funções podem nem sequer ser implementadas (por exemplo,
+        determinados bloqueios são completamente eliminados durante a
+        compilação em kernels sem SMP);
+      - a memória dentro do kernel pode ser alinhada de maneiras diferentes,
+        dependendo das opções de compilação.
+  - O Linux é executado em uma grande variedade de arquiteturas de
+    processadores. Não há como drivers binários compilados para uma arquitetura
+    funcionarem corretamente em outra.
+
+Vários desses problemas podem ser contornados simplesmente compilando o módulo
+para uma configuração específica e exata do kernel, utilizando exatamente o
+mesmo compilador C empregado na compilação do kernel. Isso é suficiente caso
+você queira fornecer um módulo para uma determinada versão de uma distribuição
+Linux específica. Porém, multiplique essa única compilação pelo número de
+distribuições Linux existentes e pelo número de versões suportadas de cada
+distribuição e você rapidamente terá um pesadelo de diferentes opções de
+compilação em diferentes versões. Além disso, cada versão de uma distribuição
+Linux contém vários kernels, cada um ajustado para diferentes tipos de
+hardware (diferentes tipos de processadores e diferentes opções). Portanto,
+mesmo para uma única versão, você precisará criar várias versões do seu módulo.
+
+Acredite em mim: com o tempo, você enlouquecerá se tentar oferecer suporte a
+esse tipo de distribuição. Aprendi isso da maneira mais difícil há muito
+tempo...
+
+Interfaces estáveis de código-fonte do kernel
+----------------------------------------------
+
+Esse é um tópico um pouco mais "volátil" se você conversar com alguém que está
+tentando manter atualizado, ao longo do tempo, um driver do kernel Linux que
+não está na árvore principal do kernel.
+
+O desenvolvimento do kernel Linux é contínuo e ocorre em ritmo acelerado,
+sem desacelerar. Por isso, os desenvolvedores do kernel encontram bugs nas
+interfaces existentes ou descobrem maneiras melhores de fazer as coisas.
+Quando isso acontece, eles corrigem as interfaces atuais para que funcionem
+melhor. Nesse processo, nomes de funções podem mudar, estruturas podem crescer
+ou diminuir e parâmetros de funções podem ser reformulados. Quando isso
+acontece, todos os locais dentro do kernel que utilizam essa interface são
+corrigidos ao mesmo tempo, garantindo que tudo continue funcionando
+corretamente.
+
+Como exemplos específicos disso, as interfaces USB internas do kernel
+passaram por pelo menos três reformulações diferentes ao longo da existência
+desse subsistema. Essas reformulações foram feitas para resolver diversos
+problemas:
+
+  - Uma mudança de um modelo síncrono de fluxos de dados para um modelo
+    assíncrono. Isso reduziu a complexidade de vários drivers e aumentou a
+    taxa de transferência de todos os drivers USB, de modo que atualmente
+    executamos quase todos os dispositivos USB na maior velocidade possível.
+  - Foi feita uma mudança na maneira como os pacotes de dados eram alocados
+    pelos drivers USB a partir do núcleo USB, de modo que todos os drivers
+    passaram a precisar fornecer mais informações ao núcleo USB, corrigindo
+    diversos deadlocks documentados.
+
+Isso contrasta fortemente com vários sistemas operacionais de código fechado,
+que tiveram de manter suas interfaces USB antigas ao longo do tempo. Isso
+permite que novos desenvolvedores utilizem acidentalmente interfaces antigas
+e façam as coisas de maneira inadequada, prejudicando a estabilidade do
+sistema operacional.
+
+Em ambos os casos, todos os desenvolvedores concordaram que essas eram
+mudanças importantes que precisavam ser feitas, e elas foram realizadas com
+relativamente pouco esforço. Se o Linux tivesse de garantir a preservação de
+uma interface de código-fonte estável, uma nova interface teria de ser criada,
+enquanto a interface antiga e defeituosa teria de continuar sendo mantida ao
+longo do tempo, resultando em trabalho adicional para os desenvolvedores USB.
+Como todos os desenvolvedores USB do Linux realizam esse trabalho em seu
+próprio tempo, pedir que programadores façam trabalho extra, sem nenhum
+benefício e gratuitamente, não é uma possibilidade.
+
+Questões de segurança também são muito importantes para o Linux. Quando um
+problema de segurança é encontrado, ele é corrigido em um período muito curto.
+Em diversas ocasiões, isso fez com que interfaces internas do kernel fossem
+reformuladas para impedir que o problema de segurança ocorresse. Quando isso
+acontece, todos os drivers que utilizam essas interfaces também são corrigidos
+ao mesmo tempo, garantindo que o problema de segurança seja resolvido e não
+possa reaparecer acidentalmente no futuro. Se as interfaces internas não
+pudessem ser alteradas, não seria possível corrigir esse tipo de problema de
+segurança e garantir que ele não voltasse a ocorrer.
+
+As interfaces do kernel são aprimoradas ao longo do tempo. Se ninguém estiver
+utilizando uma determinada interface, ela é removida. Isso garante que o
+kernel permaneça o menor possível e que todas as interfaces existentes possam
+ser testadas da melhor maneira possível (é praticamente impossível testar
+adequadamente a validade de interfaces que não são utilizadas).
+
+
+O que fazer
+-----------
+
+Então, se você possui um driver do kernel Linux que não está na árvore
+principal do kernel, o que você, como desenvolvedor, deve fazer? Distribuir
+um driver binário para cada versão diferente do kernel em cada distribuição
+é um pesadelo, e tentar acompanhar uma interface do kernel que está em
+constante mudança também é uma tarefa difícil.
+
+Simples: coloque seu driver na árvore principal do kernel (lembre-se de que
+estamos falando aqui de drivers distribuídos sob uma licença compatível com
+a GPL; se seu código não se enquadra nessa categoria, boa sorte, você está
+por conta própria aqui, seu parasita). Se seu driver estiver na árvore e uma
+interface do kernel mudar, ele será corrigido pela própria pessoa que realizou
+a alteração no kernel. Isso garante que seu driver continue sempre compilável
+e funcionando ao longo do tempo, exigindo muito pouco esforço de sua parte.
+
+Os excelentes efeitos colaterais de ter seu driver na árvore principal do
+kernel são:
+
+  - A qualidade do driver aumentará, enquanto os custos de manutenção
+    (para o desenvolvedor original) diminuirão.
+  - Outros desenvolvedores adicionarão funcionalidades ao seu driver.
+  - Outras pessoas encontrarão e corrigirão bugs no seu driver.
+  - Outras pessoas encontrarão oportunidades de otimização no seu driver.
+  - Outras pessoas atualizarão o driver para você quando mudanças em
+    interfaces externas exigirem isso.
+  - O driver será automaticamente distribuído por todas as distribuições
+    Linux, sem que seja necessário pedir às distribuições que o adicionem.
+
+Como o Linux oferece suporte, "pronto para uso", a um número maior de
+dispositivos diferentes do que qualquer outro sistema operacional, e oferece
+suporte a esses dispositivos em mais arquiteturas de processadores diferentes
+do que qualquer outro sistema operacional, esse modelo comprovado de
+desenvolvimento deve estar fazendo alguma coisa certa :)
+
+
+------
+
+Agradecimentos a Randy Dunlap, Andrew Morton, David Brownell, Hanna Linder,
+Robert Love e Nishanth Aravamudan pela revisão e pelos comentários sobre
+este documento.

---
base-commit: 791e420360669d55b7f90ca0c6d61b10e4992aec
change-id: 20260819-ptbr-stable-api-nonsense-c43d245aaf59

Best regards,
-- 
Lucas Adryell Ramalho <lucasadramalho@gmail.com>

