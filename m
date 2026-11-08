Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173578;
	b=o+bFCcUFucADKpm/TpfipKjIWyHccftHsMNPCMzIeRmxeQDa7SuMbNE/fSGXgsBe0h1F
	 FNVnRn73cc7hfDThgJlkxtRdtX+/DyZrCjP/C4MYbwBzHMLA7OhixVgPGiDDslPRJE88Y
	 E4vwgkFs3xSETvjdCLpYNrYiVGfC65rCRoznJv6fzmt+ayikD/r4c9iZhJ8UjLRZE5XPV
	 LuQwnAvyUfhZNAg0859L7J6UOZxlEnMQy0yIIUFFYSpsTs3fthrOs7L21MRqFp2F0YrzK
	 HSmbSA5nOvzmh19/FmfRiV4yUDyZYREhaJvwqMpbGjDTImAiy9dnQPwDiy5H/91disg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2zV+j1o90j03z3/bSKQRAMr2OAwRnzRNXDWN23pKxKc=;
	b=ELLoThijoY2UUm0Y4g2zkcV/Oiu5EnVaF1f94Dzd1IcaB9GmM7BlBLRm2VBM0MWdK94B
	 /8ao7QswDxRi+l05zpVfPBKVgE1APF7fCR25nINVf4Xb5Dgb1N66eRjPX0mPYo8LVa7tz
	 gzt6pX+PMHr6OZ/YImQuxRlw1RiM6i8Bi6W6rM/3ofsnK2E7YhHrHMXg/pLCTV7aRbUX0
	 JHxYcTcq0XbyREim6UTGuytcP6idNKKZAFrW5DFkZ9pM0JxUMtwNgv5S7GoUqJic3+IeZ
	 sg86mWzVcJcg6A6xexOR26Eoky2mePVYuS9qN9jXC7INaqmFN1iRLKIvQ01ynfQ7ZuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g1thKR+m;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A31606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A31606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g1thKR+m
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490f38e9688so196966f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173576; x=1794778376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2zV+j1o90j03z3/bSKQRAMr2OAwRnzRNXDWN23pKxKc=;
        b=g1thKR+m3D3E2+c4hjI7QL3t50zazlEow2f3cU3NWSOcbViKGU+bFhuwrFyNJLKhd2
         zHYXQnPFcPXe+OTWCNJAX5Doukw0IgV0+hx6/2omnjkeERyku7Qd1BPmTfG2Ec2vQYCj
         jBrOKkbpvQg6C2Qm/j7T6X8EjF/sd57iirCc6AnfscRPrdsjvNwASYBi0OE8oqXwYdCi
         zJl7umWLxRBDsqPH+gl3WB/UhcHVkpQHMEdZEB7hHpJ+Hv7UTPn8Nlv6LyoVls54rMcg
         mIo87yVqR5TSb6XzD5jEPo2n6Qli47aCR0sHQax0ubMztuUql/507jGMoGih3Wy2gIqR
         MqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173576; x=1794778376;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zV+j1o90j03z3/bSKQRAMr2OAwRnzRNXDWN23pKxKc=;
        b=c0bLlD6pF4uCfB1O1WYI1KWHHrfvUBAHskCMOsfHTXst+0YCa7vpUXTsiMnmxdeGBx
         WYgy/WhCueWWwUVXJEqnMZplR/UxR4VXHLfFhZy9y5n4rv23SZCnv0AiP9eLxmGTXPU4
         I94//bsMbl1jG/YI1vZQpY85QgQr/OljaWwVPSCM8EdOJqYQcD1m+5VHyOQUadtTG7fo
         OcuqHbYDoCgkxDedB+RU0SYJXSDmrL66ZXH3zpilIogpK4T0h0SmQE/xWzCGRU+egQRS
         i3aqRElZOtRx3fYU6sYv8JKXT7TeKqmy4OksQcqx+0u5VEgsgDpywm2z+tLwrGFsm6jd
         4zZw==
X-Forwarded-Encrypted: i=1; AL+hErGJub8HqawkbnEDad1KonaLCi8I/8xvSw/zGX9s3PzNAc21IRoZ9SjFOackckXWTp5F/PrR6EtKK8rqqKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cU1wHxiT2slQW2EC9NAHTS2g8sk9tSa+ITlgzwVi7Nao2Y5t8
	tsTd0IlRFlZBQFWFcZdbQ53Hlun8ul3eR1IvlNStAzQVz9QKEe7lMcVr
X-Gm-Gg: AYBFou0s2xoVX5qKpJhFEvoEbMRA+YUB9HzZXAY3S+BOSbrl2x9aftr9ApYckog7815
	VjB7KBj7zmV4oJRGsQmQz/UgDGVlccwW8L1z4PQ0M3BHeS3vS6RzZdT6/3wJrQotkdYT5c6urej
	rNM+WaJrBecr/QrN7y7u+/ft/8epI18kiOaMssBu1Og4M5bCO8AwQ9f0SaeScdvJeN2BRmUFIHs
	oC/97N0Jo4ZH07QlQlD39AmkxV8T1G+6aVOmzQFN9z/QpZiEajlmZyBVlIzzY+9rlJsXP/elp8N
	xnzhR/8I+NqN5ix6+B9nNZNQtVGUu/hcaysYSS1LYErWTM7uAGYWZ+WdIBbHkGk7yApFIUwwfa8
	KedG4glr0tkkbvk62GJrmQ3ZJ9NPy/sj/tTBi1mMtQT5f7yLNbM7y7SDYAChcQHS8Ldz20Vo3Nm
	Hp+7kzPuNw1pFuzIS4mSi4ztJ4amsOEJ+r+hlRxvC/AaZ5ECGdgOjpy98flWFs3d8frPzoDe8nO
	h2V//9b06R3TLZ70Uf8gM1sY+nUUxtWEV6wBeriCeS6C2wIJe5g1ThyLsisHvpxQm/ah1QTaK9a
	EVgB1o9Az1IECMARxUVn948T27MqV4zcIRaa8wyo2C2aFbGuvgACgJnGM5Oc+Ats
X-Received: by 2002:a05:6000:26c8:b0:48f:bbb5:61c2 with SMTP id ffacd0b85a97d-4958852d3b8mr5479500f8f.4.1794173576292;
        Sun, 08 Nov 2026 13:32:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597371cc4sm5861840f8f.36.2026.11.08.13.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:32:56 -0800 (PST)
Date: Sun, 8 Nov 2026 21:32:54 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, dennis@kernel.org, tj@kernel.org, cl@gentwo.org,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, bjorn@kernel.org,
 pulehui@huawei.com, puranjay@kernel.org, thuth@redhat.com,
 ajones@ventanamicro.com, ben.dooks@codethink.co.uk,
 rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com,
 conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com,
 seanwascoding@gmail.com, andybnac@gmail.com, menglong8.dong@gmail.com,
 cyrilbur@tenstorrent.com, wangruikang@iscas.ac.cn, atishp@rivosinc.com,
 apatel@ventanamicro.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org,
 arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn,
 linux-arch@vger.kernel.org, llvm@lists.linux.dev, dave@stgolabs.net,
 emil@etsalapatis.com, ihor.solodrai@linux.dev, broonie@kernel.org
Subject: Re: [PATCH v9 1/3] riscv: implement this_cpu operations
Message-ID: <20261108213254.67805ef0@pumpkin>
In-Reply-To: <20261108110406.97495-2-cuiyunhui@bytedance.com>
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
	<20261108110406.97495-2-cuiyunhui@bytedance.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  8 Nov 2026 19:04:04 +0800
Yunhui Cui <cuiyunhui@bytedance.com> wrote:

> RISC-V has no asm/percpu.h, so this_cpu_*() read-modify-write
> operations use generic implementations that disable local interrupts.
> 
> Implement RISC-V-specific this_cpu operations with preemption disabled
> to keep accesses on the current CPU. 

Have you looked at some of the schemes (I think arm64 has the latest,
but also s390) that do most per-cpu ops without disabling preemption.
In particular they save the pre-emption check when pre-emption
is enabled.

Basically the code tells the scheduler which register contains the
per-cpu data so that it can be 'magically' flipped during a context
switch.

David
