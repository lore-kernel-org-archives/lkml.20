Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794683425;
	b=S0a9dgGb5kFtXJy+FXyISvEDYOL9TSxLvUkhKKIXv+sNDiD8mcJNuGaveOt5ZPx3BYM/
	 H9ZJodxaqVh1l3pddfndJPefrFb3dGcEBDzzWOR3u9wYfnIiB/PudR5rVj6r5YWguh+ns
	 W8SYiAgSbYn8A3RAD/HCZrBvETbXxulfYUSCbFr793wyzShf1AvfHhJFQbFgv8Oe/7qJS
	 wa0q4HYkuUl/AUNP5I4/QeNewhNvVFVmcnXQb8mkbzKe3nWgLmT6l7ErhCu7CovBYBUyQ
	 hLwEyZTpBdLNf4DHdCm1qCCd4bKkuMhfHu/qULJzG3a91jDiDANm1TTvhRe/ukFpuzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794683425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DhlxCKd+KZzJqKapHW0ISZ0Xg6L7zDgMd5SLbJ3iQ0k=;
	b=0S5uiJvQvgdh2THmDoWDyO4IGa16O9B9f10KIyMB03apIw01A1bbaTNChQ+FWRgI33lX
	 gfhGyHfWQ9I3QusOttUTZWemurhJhtcrJvFJnfS7v9FyqsmyEQdRB5wFf3n1ViR+VuO2u
	 9WlJBAot4D2osYUN9ugPtk9EVhJPf0kiR3bUyfb+efUQEtmTObcqqkyDTN2hubwXliXD7
	 CntLuNNLb7Kbvs9Q2vGZbrumq4eDvgqi7gGf4vDcxp3fhicP++TK5P9GuYV64l862yUsI
	 meT5wA+bQiQLfhSELppECs5KdwwQsrJpuD96kdZX1Zb7i548SMqFi8mrK7vpn8kTqig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFzHaxc1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE71606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FE71606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFzHaxc1
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f20b304c0so287542285a.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:10:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794683424; cv=none;
        d=google.com; s=arc-20260327;
        b=er1Rnu2SluIhGTDurWb9lJuGIqs8K8XetE0N74fQCsCRTgbBX6UfS96PbuOGqQiJNJ
         4VM6mFUmmBsy0klRk3rSsz93bbIIDBNaWmeCJA5scn2On2W89dYLfOVtNTcDMEJ6izY9
         ZOwPovo3TQPByyTGZts3mYjj0KHnf1D2iz+l7ILPvzdsmrotSYXNWONcbNkGuLILwuXo
         Usg2mLi9Tmxv00yu0FtghTgScY18AUC0VmAKBOcN79wiCG0SUReDzaMdk02WHGCyn9A9
         GbfekSE7pl6gggWwJ+P8irRF6GMzenmIEbsXK8sEZEBgehs0ZFpjDo/TIOaiaAsq2GXG
         M0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DhlxCKd+KZzJqKapHW0ISZ0Xg6L7zDgMd5SLbJ3iQ0k=;
        fh=5yRN23fALDl0zbT2U+G5g4OoXfbdv7wFgqGmJNshtFA=;
        b=IZdxLOOkteVJECbmn9gmvCFvzlEmIG4n1h4e3YzIqul2fkqCqPPv/0dkqgrWTgHpU7
         VNg235Y5eg8XGjqgStFxR2/CsJG28AjQErRgESHcOh2mGys9Czn+AeiT/80itHXBS2gX
         7ykCG28YI44ypsAiF1F+MSnMDYf5f1JDVludpPQNVKije/wfknXiV/+ZudF/GLVvLa2c
         TDeR7df/W1VMowanUNnhAD1ddP9PLwbvfJ0BDePiiWFhtunFveHxnvhmpSy5ldL6M4RM
         9Y119dx4K26naZCSjh65MZjqdTfn/KaMvgPZviu1XSRm3qEl74ktsHqTux5tgneKu2vg
         xfkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794683424; x=1795288224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DhlxCKd+KZzJqKapHW0ISZ0Xg6L7zDgMd5SLbJ3iQ0k=;
        b=gFzHaxc1HJV5zpNrG7qJ+Zk5zMBAxMSLMXq0F6iwaLD5xa8L0+kEcljLnIGuinnG97
         SDMcPMd1UgE2QDTzJOIu8t3Ye6jm431mRyRiq58COoabFXjvhtNsOofEpO7BDTnv27b3
         U7P0iPfTAQpxAm6L+QhqjfFuatJOq1vcvFrpQOVCVVJTNg67jkAxbuFE9nrYcvDlTAZi
         wYH67Q6yeRSz4UTrpiwDKj59ZzrPAgyYZ0HFp11xj/tw2o7N/1adsA+Lz3wxe2Q53vql
         CP0OU4T7iiX3zz38B4dgbdee6yP4dSo/LpV+DS7zjEvbyT8E3D6UoXOyhzaQ9V6uV4SI
         EsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794683424; x=1795288224;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DhlxCKd+KZzJqKapHW0ISZ0Xg6L7zDgMd5SLbJ3iQ0k=;
        b=sUOfyrnQdx/JNbW+sCGHGkEyMvb5GZOKScKXklB7FjwDZz4+pjZLwXkF3/RO4y0HZL
         AdERjzJnJGcle3rwjPmr1CS0JDVDamQShtBY7PNvLNdRiaWl6932iBKEHEPJSBIDHzjD
         P/vTTFKvdUglbjDO1V3kvxVHNX5hgItyhq8fVAWI3cycZ4BAQZt7yzgmPGn7By3OdqZh
         nSaQs0shIOe3DTauVGBGVIXcJ53k4d7rINvPg5Rq3gXieakRdjf15Qjh637NwfbeiyeC
         sof6GW3Jpypeiia5fL6o754ttcFmusMkszB9/7QOZ1sk1+hoDKsaJQMmEAoOlHSoi3P/
         LnYw==
X-Forwarded-Encrypted: i=1; AL+hErGhqQxlg3McFGow+yiqJeSkb8F9Yq5JcIE78nToSvjjwZ3EPUqbU2dGImJjrEH+NrvW9pDT5oD45W0DygM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gl6GjH/o7tBczBPLAri79O9ZBwFSHnQihLHiSu2XZHi7iwQAP
	+Mpa5pzouye5Ws4MReQzlFI9uqwK8xNwrvqD1rQnwm4FgnwtawKKvGrl8gtshxNsWAIkG/xxohy
	xcDT6FIRS6wjbr7qA6ZBS/DjRBbuR8OE=
X-Gm-Gg: AYBFou2G4Gs9K4S1pYNjQ4ZeC89gfRpkeHV4YiXtofx9RcCWX8YPtbxang+9BQE0Up6
	ZpIE7xQNadLaWwO+G+Tl8v31AgkHt+vdUgIymcYACEaK49nngPBFOZRVWxU6plaiOYNWVX+tjg/
	Uov4+1NLSZnV0wdVqXa3WD7nKDEddJDPj3ZYdsc3tdQc7HdNlnxXRl2yitJeML9Ui88V36m6Grg
	PWZHkw5uXIQpa9u8DlB+CgilDCyCftwx151NGzs3J7qm6yWMz0p/RWIfINpQ3OBtDdiFZH5w0bl
	+bb2BCpH6b+SzWI0EEZwz7lljJZNuFIOs5okBHl+XoB4QXjXrkNKBalAwlPO4HrkPKVY+Z1WtYi
	0dyXi0OmFyB409OP+M2V3U1E7KL/I+Fuk0wTSiTTa44j3gyN8ZXLx5HVgWpmDv+HB1PZELFao9B
	lh30uZxjjkPOVim1IzkO7lPiU7BXw2wklifdyXaw+3FQYA8/YE2JhvjN3p4Rs5kIr1k/xqkZHVr
	PAXLoq52zNVu1ixwaH6QCty0zKmvpzrOMvZeSjJPTuVfWBmB4E5og==
X-Received: by 2002:a05:620a:aa11:b0:949:5db7:b32a with SMTP id
 af79cd13be357-9495db7b519mr625571085a.43.1794683424352; Sat, 14 Nov 2026
 11:10:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109032455.33944-1-giovannamccds@gmail.com>
In-Reply-To: <20261109032455.33944-1-giovannamccds@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sat, 14 Nov 2026 16:10:13 -0300
X-Gm-Features: AclHuK_svhzBL_72bU-7E0tguzC375yULVehsGbkjU9zs2ybvjMf81kxBuedYa0
Message-ID: <CAMAsx6fc4B6TY3otpkiQ4gUDT4vzz14jDp1nj+5vpao2zsb_8A@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate gdb-kernel-debugging
To: giovannamccds@gmail.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Giovanna,

> +Configura=C3=A7=C3=B5es:
> +--------------

The original heading is "Setup"; please drop the stray colon.

> +- Crie uma m=C3=A1quina virtual Linux para QEMU/KVM (veja http://www.lin=
ux-kvm.org
> + ttp://www.qemu.org para mais detalhes). Para desenvolvimento cruzado,

The "e" ("and") between the two URLs is missing.

> +- Instale esse kernel no sistema convidado e desative o KASLR se
> + necess=C3=A1rio, adicionando =E2=80=9Cnokaslr=E2=80=9D =C3=A0 linha de =
comando do kernel. Como
> + alternativa, o QEMU permite inicializar o kernel diretamente
> + usando -kernel, -append, -initrd troca de comando de linha.

Please use straight quotes for "nokaslr", as in the rest of the file.
The last sentence is garbled; something like "usando as op=C3=A7=C3=B5es de
linha de comando -kernel, -append e -initrd" would be better.

> + voc=C3=AA deve construir(Build) o kernel com CONFIG_RANDOMIZE_BASE
> +- Construa (Build) o kernel com CONFIG_GDB_SCRIPTS habilitado, mas deixe

Drop the English "(Build)" and fix the spacing ("construir(Build)",
"gdb(necess=C3=A1rio").

> +- Construa os scripts gdb(necess=C3=A1rio no kernel v5.1 ou superior)
> +
> + - Crie scripts_gdb

The command is lost and the "::" literal block is gone, so this
renders as an indented quote instead of code. It should be something
like:

- Construa os scripts gdb (necess=C3=A1rio em kernels v5.1 e superiores)::

make scripts_gdb

> +- Inicie a gdb: gdb vmlinux
> +
> + Observa=C3=A7=C3=A3o: algumas distribui=C3=A7=C3=B5es podem restringir =
o carregamento
> + [...]
> + Para ~/.gdbinit. Veja gdb help para mais detalhes.

"Inicie a gdb" should be "Inicie o gdb". The "Observa=C3=A7=C3=A3o" block i=
s
indented 4 spaces instead of 2 (as in the original), so it renders as
a nested block quote. Also "Para ~/.gdbinit" should be "para".

> +Exemplos de uso do Linux-provided gdb helpers
> +----------------------------------------------

Please translate "Linux-provided gdb helpers".

> +- Examinar os campos da estrutura da tarefa atual (compat=C3=ADvel apena=
s com
> + x86 e arm64)::
> +
> + (gdb) p $lx_per_cpu(runqueues).nr_running

The "$lx_current().pid" / "$lx_current().comm" example was dropped,
and the $lx_per_cpu commands ended up under this item. The original
has two separate items: this one (with the $lx_current example) and
"Make use of the per-cpu function for the current or a specified CPU"
(with the $lx_per_cpu example). Both are needed.

> +- Explore os hrtimers usando o auxiliar `container_of`::

> + vari=C3=A1vel `task_struct`

The original has no backticks around container_of or task_struct.

> + fun=C3=A7=C3=A3o lx_current -- Voltar =C3=A0 tarefa atual
> + fun=C3=A7=C3=A3o lx_module -- Encontrar o m=C3=B3dulo pelo nome e retor=
nar a vari=C3=A1vel
> + do m=C3=B3dulo

This is gdb output, which is printed in English; "function" must not
be translated. The original also keeps one command per line, without
wrapping.

> + Guia de depura=C3=A7=C3=A3o do kernel com gdb <gdb-kernel-debugging>

The other toctree entries in index.rst have no custom title. Please
keep the same style (plain "gdb-kernel-debugging") or explain why this
one differs.
Also, the patch no longer applies on current docs-next: index.rst now
has a toctree with userspace_debugging_guide. Please rebase before
sending v2.

Daniel
