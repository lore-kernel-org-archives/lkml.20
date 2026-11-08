Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794151465;
	b=u0FXg8zl3vFEedq7Ubl8BKywF1DSA9UAEp/KUkPehZ1z9d8kuYTK1PXIIQCqvKuExdON
	 MF/p1K+KjF4l8IdbhzLFL4UXLVYIWFNZTxFsAa/d6KBturm3YxGk9lNoSx+21hRnSR5em
	 2Mu6U8F2GQhFDBFF12awt0j9a7pUhEdFAjxp+gw2jrjGfuxdPifdg7vp85jqw5RBKrtcI
	 ILji8lj+F3A9/j1foGUxN5qByKviiKz5Ih+ShprMFmuEu8n59kVO17DI20aRFAEFjL0yn
	 LF5rz+2DvtEiKBAbnIqYvxTRev85cR1XRyn+2RFkoOe9riiWfp/LDdewbhY5J75+/Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794151465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UxG7GXUsicfCIDfMFjBbx3umG5dZ58gNRJ1FSEEffBI=;
	b=kNysk+EOohhS7N7OJv6u3sIvczmEgH6NOqO7rN/rOQhOPQK5H9AwWFrNTzVyE2vP6GpA
	 L03mnb40DXpLFV4/0YbZ3gNAY8PJOMARAP694zQMfoo8Bz3gqP/wR9+zfsFLe0Yv07zx7
	 IF5Mdy++xJZhV1RrIxGa9NXvPhWKYaDEKUZ+QEV4BPSeqpS7PJZSdUjCK2xCnhU+KiFwt
	 DSaVJZRc8GGs0/mFWTY8ZhpcGDqF019zT2TIGFV2fvSDHs0R0/Zn9Jiv0GdHMjpHqhRGa
	 /cjzeQsorT3V4YImdM3nvMxq5r8Dh4LIi6Ni1L8lduC7+L+KaqUrfRJmHHB4oiKo83A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=gD+h8bUO;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF2F606A338
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF2F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=gD+h8bUO
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eae12762c9so42505e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794151464; x=1794756264; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UxG7GXUsicfCIDfMFjBbx3umG5dZ58gNRJ1FSEEffBI=;
        b=gD+h8bUO+1L/eQe9FHB+DiMx8C47qRTq+a4g17dQYS7gvvFLCuTolDCZ6PARdyuXX4
         acZ8D3aMWZ0aa6cKiWw9k1VJHJ1iQr2VAspHk/gWMdyNJBMzXmWegP7sBmZbKxuy/GSM
         6JAoTLO82VE48THmZelnCmHqMMm+d64i6eKciHmwUjRaXLqRLW9AGr46IB6G6vAJhh/k
         hCcFJPPLlmZDQzIFVS4FxKV5X+kj5htqBjd1kuQ4F7VFC3wktmsCi0fwrK1CkrxfLKaw
         qJo6qjeZqvDolqJMLqt0LmJuAa+/3+PlkUh7G1Z3cDLjttC66XM4ejrBpHkqVxcvNXZJ
         fH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794151464; x=1794756264;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxG7GXUsicfCIDfMFjBbx3umG5dZ58gNRJ1FSEEffBI=;
        b=aYPiAdfKydiVOBsBv8ae9THGbAxF5NbSDIpQ+jNOxArxI6ak5G3s0YWlBCwx3omil6
         SHWE/Ch4w19N3J8lAfk+FWeUK+ToaL/npS8JEVZweK0KiJNN4ItESN5gAJp71ckd++cq
         lYj5wCdlBouiQFY6mf4R8bXfXZ3O38AdRgUa/q0S9FQF/BQWwdH1I7aTWpPl3yQTyL3C
         T46/gP+xgYq8/xijFiqONVWPyD9u0xTAW3RqNmlKAPl7lKUP++aaElnoPwS/Lt9+WNqX
         Vj5L/IvoiQDr99FcHA7QqmfNF0Mg5sqC1AxysGK2PJMdyZGcgj1Rvscf+0W08zmX87Mz
         ZHlg==
X-Forwarded-Encrypted: i=1; AL+hErEDrhjgwtXZ6/tBHyzJ17F5L3eLABa6stxNe6GTOZj37H3vRu5KWA83kg2rqAujjn2Rk6QAq+0PcMV9ACg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Dg7rFLHZrGxO+5mlrkWcM3xm2KL6UpHZsx5A8mbpQy/w/pVir
	WRH9c6mh04NOxi93xV9jWhLDkaxiWdh74ObCo7vwLBQCzh+8XZAUx/SWnEX2nuHiZYk=
X-Gm-Gg: AYBFou27A4skAXkw9TosZG2WY09muQ+PFTSvVnR1n5kIzexoeGYwKNhYbjRetggyjEf
	dIp55peHHFNcdU8G5H7BVB6umQptgUdeauvOBehttaFQ0hhNskbaF7FdWGgrrc786dRx6rYANfc
	XQ/+whBBV4me3H1wWX7Pc6sz/eH/2KPdgrKHRYF1TM0ctdkITDymhATuDyUHRMiuQihzceNFee7
	WPDreImrLaaPmYE2EEQ8Gqc1hD82sy/aBeBhPp2YeumUJfvWY1H9cTbkyDHVWlH4PDzoAOBRWkG
	GnKSWgdjz7qts25krIF0ZsoGKueJX1gFT/96jB4pxnKKNcEkzYa4Pa78c6ADARALLbY/WiKHI/z
	4g8zLLtYaFhRK9nxjySpRXpa4UKb3LsSQ0RC9S+Cug3BsObawuuttycqYBZWUk9dO18mofP2CUO
	r52TfFQZdm7w5kC6rZHdiKyCUbx3hG9SGfobpiEB+2/BSmhURXQIsFvkBs0BsUPsfgnATO+cW+g
	JxsVODwMwHQID++Ew3Zgd+toP+/r1hnOvXZetOvItWzT2uiQGLBQnunDpQQ9NzYLWArAV5UN9Lg
	h+emsQlZ44x5N8aRFJKw3aFbaL3pwdqzcywB2ntbqzI4c3wDWgB0MkL7vvHJJv5krIq6DUEK+S6
	SviUZpiqZOEqDlZ/5CbYVSYn+eg0PgbcrCu4K5xqIkOWn+gc=
X-Received: by 2002:a05:6122:546:b0:5ea:389c:51fe with SMTP id 71dfb90a1353d-5ece725fcc1mr534957e0c.17.1794151463870;
        Sun, 08 Nov 2026 07:24:23 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ece60c1adfsm2166205e0c.8.2026.11.08.07.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:24:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 4/4] selftests: liveupdate: Add riscv support
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, rppt@kernel.org, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com, 
 shuah@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
In-Reply-To: <20261106071459.2003-5-cp0613@linux.alibaba.com>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-5-cp0613@linux.alibaba.com>
Date: Sun, 08 Nov 2026 10:24:13 -0500
Message-Id: <179415145359.358073.275309518363721943.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=417;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=FtmrOogkqyUZ+q/8/Vic7Il7P35EARJys1IQgDvRVIs=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8JQhVEhYRlNImO2ueIVy23Pfe/4w2LJsKj2WG
 qH/Tmd7+XeJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavCUIQAKCRC7dyhM23N6
 3vP+D/sGPpbNDhlfiFA68lnaSlf3Ud1W6sEIzkODc2Rr/nh/XGhE/+iIjOkpoSCxRJE/NO9C+DG
 jRVkLElYMybWKAUMrMtK/FIY/Mmj3rQk8/+k2K6EyT8bp5Y5pm3UJWc3keXSIflkIzqBrdk8OXd
 jc5vEvhN6qdxqdjUra55/a8LMtN17XIqisUGChRTOKnezNh85HlE5QXwKBWEqOhTZjrKrntjYer
 eOUgHTCNquEbY7APFlbwpmVAwBwissclqIuP6RyhNBxnQRqOXacs8aiRer/a3lrBw56srBMgGEF
 Rz9b6ezMwvCKh5xpZJRAGlCpYcn4mztgSYF7qcsBmQdYhJq7h6bupQliFFODDM+BF8IPhTU0qYp
 JpCLkQvAUYKCSzApDXp4mGTNdwfPr+Dn/vL7vv21BiZ3nYC2zdmt8L3v34AoMkQuK+a0s1nUWMh
 syI3MknQ2599AHAVwKArwt3/21IjEzIIbZzcZdO+XsALXP79CbPrgN3Tz6Z+h1Dr8LB3dmfQTFm
 nhFIECmygvfqj7AVJQhQeN3IHyDJyyhpqLb3t7HlTEs4+MYEROzKSC+8ZZogWFtGCHVfovlcKgP
 uKerMtzV8HQ4ZSBMJ1ZQ5PX9EMGpc8uOa/dLCjDJX6tjUtcIEoU0vWb/7qtwlMVuPp0e1ny0g4M
 TnCpyQ6RyzM/VOw==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Fri, 06 Nov 2026 15:14:59 +0800, Chen Pei <cp0613@linux.alibaba.com> wrote:
> Teach the live update vmtest runners about riscv64, so the LUO tests can
> be run on this architecture.
> 
> LIVEUPDATE depends only on KEXEC_HANDOVER, enabled for riscv64 by the
> previous commit, so nothing in the tests stood in the way.
> 
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

