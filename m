Received: from mta0.migadu.com (out-112.mta0.migadu.com [91.218.175.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEA437C118
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789204921; cv=none; b=T0Eu8szuptbGne+piYN3bSQ29IQ+/HGTqoOeubye5SeinAtCmvgTxu44fvQ8tJWqCzrUm/0AhRXkjWNo7lnjLZv69fwhwwlrPolX4/0cWnpKUvTyLWSGLVYd5965EKcWL9r8aW9Gr53DPC6WKWg3uXtFoyXoNd3J98FXDAdk5EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789204921; c=relaxed/simple;
	bh=xusJf5PESRwcD2i13JAzwFEVs0sWpCvaZYs59zxBFCg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=ZdILabQY17SLeQKwQnkEgGS2Bjh3DsduUW62rRpC40s568jHZ7f29TYHwp2UJOpy0OI8QOZlnqJ8cgxug0Y75br9qkMUydei6roF14BSWVbl/43ArfH5B77cleAI3Fs4Q4feJMynzykjQCfMuRTuAUJ6sJUq9VjqgR7NDAG1eu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VbvWflgZ; arc=none smtp.client-ip=91.218.175.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VbvWflgZ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xusJf5PESRwcD2i13JAzwFEVs0sWpCvaZYs59zxBFCg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789204916; v=1; x=1789809716;
 b=VbvWflgZY2CdgD1mWnEq8P1AUf2W/B57gXTBxYgAoLZJWENYqST0/E0ar9i5tBjP8zag4YRt
 twJ80e89bEbU4SWfxhbdVJmyIbzXzknKJACDCNEGu3z4F16YHUjVYdAGG4I6m9ddam52AmvVWuh
 9NnNbam9El5Vm17+VRVdFoqY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 92fe4840e74d5e8c;
	Sat, 12 Sep 2026 09:21:56 +0000
X-Mizu-Trace-ID: 92fe4840e74d5e8c
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=85bed982e8b0fba7f9beae6a80921f82f50abded422d5a3e21dc24ad0c50;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 12 Sep 2026 17:21:46 +0800
Message-Id: <DLD87F4KVA70.JK2UTB6A9HZF@linux.dev>
To: "Guo Ren" <guoren@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Andy Chiu" <andybnac@gmail.com>,
 "Vincent Chen" <vincent.chen@sifive.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@rivosinc.com>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Palmer
 Dabbelt" <palmer@rivosinc.com>, "Greentime Hu" <greentime.hu@sifive.com>,
 "Heiko Stuebner" <heiko@sntech.de>, "Conor Dooley"
 <conor.dooley@microchip.com>, "Kevin Zhang"
 <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH] riscv: vector: Fix data pointer constraints in context
 save/restore
From: "Troy Mitchell" <troy.mitchell@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
 <CAJF2gTRn4keG=peEKkncgdsu=RLP3N0Ev6cO7mzXg-J48R+bEg@mail.gmail.com>
In-Reply-To: <CAJF2gTRn4keG=peEKkncgdsu=RLP3N0Ev6cO7mzXg-J48R+bEg@mail.gmail.com>

--85bed982e8b0fba7f9beae6a80921f82f50abded422d5a3e21dc24ad0c50
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 2:56 PM +08, Guo Ren wrote:
> On Tue, Sep 8, 2026 at 9:03=E2=80=AFPM Troy Mitchell <troy.mitchell@linux=
.dev> wrote:
>>
>> The standard vector save/restore asm advances datap but declares it as
>> input-only. An inlined caller reusing the original pointer may therefore
>> use the advanced address instead.
>>
>> Declare datap as read-write so the compiler can preserve the original
>> pointer when needed.
>>
>> Fixes: 03c3fcd9941a ("riscv: Introduce struct/helpers to save/restore pe=
r-task Vector state")
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
>> ---
>>  arch/riscv/include/asm/vector.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/ve=
ctor.h
>> index fffe72a772080..c7fd6d50a7a47 100644
>> --- a/arch/riscv/include/asm/vector.h
>> +++ b/arch/riscv/include/asm/vector.h
>> @@ -230,7 +230,7 @@ static inline void __riscv_v_vstate_save(struct __ri=
scv_v_ext_state *save_to,
>>                         "add            %1, %1, %0\n\t"
> Yes, %1 is modified. Good catch!
>
> Reviewed-by: GUO Ren (XuanTie) <guoren@kernel.org>
>
> PS:
> Don't forget "if (has_xtheadvector()) {" part, thx :)
The XTheadVector path copies datap into t0 and lists t0/t4 as
clobbers, so it doesn't have this issue. Thanks for the reminder!

--=20
Troy Mitchell


--85bed982e8b0fba7f9beae6a80921f82f50abded422d5a3e21dc24ad0c50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqUZqyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+xZwEA+t8LkOK2u846
sWTr9TB4DTrxQaZhXCLSCcAN6skfy0IBAOcbizQTGtps1f7cR6Su5Am/pgwxKYWX
EJuH1zNJG/MN
=E6bw
-----END PGP SIGNATURE-----

--85bed982e8b0fba7f9beae6a80921f82f50abded422d5a3e21dc24ad0c50--
