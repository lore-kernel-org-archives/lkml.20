Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E5D4570D8
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791730142; cv=pass; b=Wsb016jYnNYZK9QrpC360qT8uaZ3itBt2zMhwvKABw4iiTycUhx2vMDrl3jO++54jDuHoxoNzpYSoy7O5ZJivpUXCQfetYk9I01D6R2eLUd4ANwG66IzF2uaAX3/6eft+ijTEW13JPniPzUHtKjEqs3uE0MSUyc+IhRZ+ToSFnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791730142; c=relaxed/simple;
	bh=KTTmDBDLvEzXTcUeFdNHCL+XWsl5T0ZipzxiDJtTFzw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VN4JjvBWiipIRdHyfvhf/32guqO8mavnCwHboa6N0UR70e2+ER0HfFl+uv9KKnwHSuNswTmqEc6gNOP6dih0unZwdftAzwGOfoB88n2W7eZfNWWmJuWjyNtwvEJscJqD5Hwsf2FqFHTQHHT50x21qDORTHdjKYE1xequXWmdDjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ol0HXaXa; arc=pass smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ol0HXaXa"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6b19e291cc6so1281555eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791730138; cv=none;
        d=google.com; s=arc-20260327;
        b=ct9mEJU8ssOLo407iQUcsXbrkPqVbciWNeee4pV4dWAIj4Wl0PPoTXNl9N5/DgPM2Q
         SLUpcki21vigb48M2B7vNtNMW33rFI6xrwVkl23Ka8qzNC/P0Oe+On9lTaVIcaHrKWFo
         lFXt65zHtJxU7T4Ph+kbdrlSrBuASbNEFOY/1uqMjVJ2PTAIZI9umMYuOWmQALYkfkZ9
         LiBHkYUo2IDkQSbt6QTcgCheQERQgeYdYTqAXtrna/ckSLNhVYf5drEZv+TqJ0mzCooG
         KVFN2roRDy66PyL8f1wty0ZB3yqCzS/m/2o8Qs5IswU3tthrw/ajMW6eTg6Zhh9URpV4
         XVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=eSAItQD3XdnMYrgEBGA328w0uBEEk18b+E5vbP3GsUE=;
        fh=eawyxtJgBnC7+TYZrSMZzgocw2YYl1rC8Y8RCdGRdcc=;
        b=sgjTxJAq9nwrlkZU/+qeIcTCSuN2tGINFGXKenDpkvbY80IJiwZOOz2FYuB+vaZQTE
         pSbeQRA40B32Qv2b4U+9QJzQmMqTju0KhLsvqwyrmTWCG5VxspqISuWkTK/Nr6Up4jOM
         V4+lQ4Gjqzs63NNmaD93oriU7FV6lmPelBWgAwaecc/0eRrtkciDv9qyi/kfQllns/sh
         1tl5mThQg1TJPgZF2AHLnTvemlhQPsqkHybO8eKH39mwoAvTRZyDC4XM0cU20ht9hydh
         rdQTy/1xjXGTiZZAeJ8Ity8xi+JhzIeJemy03o/DqzW7T4AiEG1st2yZpRcGMXxibuiW
         aJWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791730138; x=1792334938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eSAItQD3XdnMYrgEBGA328w0uBEEk18b+E5vbP3GsUE=;
        b=ol0HXaXarRSSmXNWm2M24R2JXyslD1tZpsEbjfKZq38kESqn/P41+dltQU8dcwTwmS
         h4eJ/WZ3yG/HAu2bxBTJ1Cru1DCr40nujOJE6W2QO/wWvEg6olRCGBFyDvO/F+1LS9If
         4F7zNllWJXofBPlrg8CZ6SNZoa2SwMMFJ2TAA9/Jtow3YrandohNNsO9yeatWHmRM1pq
         Km9xJZZfZOw42aeR344jAHunxF9BcpsTrg2HlTmrGQPXq7kD6ePes/E85oxqYDQ6RJrt
         4QfFb9hUD42lATmSfIH6IsLdobW63AHb1NkTFEykSu8fVBqPY1rB9fn21p7ungRhwLU/
         RG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791730138; x=1792334938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eSAItQD3XdnMYrgEBGA328w0uBEEk18b+E5vbP3GsUE=;
        b=O4DFmXo+CiOOyFTRS0kaHAepziHQQFn4Wqh156zX1rRJwqTOchTOMqFMSpL25C98ef
         o77VlGdsWvndbIL+Fm0QPqqTzrmAdArjGl9Q2kIxnsDYlud2Xmx7BZ+rrK2r+i6Xmd1J
         jDnOgipBB0aMonkEHG9oB5ylB1uZM4IoobCDhvnL6UyNlBbXr7LcrlPK7UcyVZcsAtao
         b+WweRR9uDNt7WL7VBbDG0ueCCaHfy7Hptn8chcKls6rdlvexT7N2CmpkXqZH178/kZz
         UtntaK8SPP52Czyp5cO/I2OOdCMAXshpRbZ8X0LSqQVzP16DgszlhmsgN3R3P6cWYE8J
         hEkA==
X-Forwarded-Encrypted: i=1; AKwUvBzhbKIaK57ugAUtFvtx9IahhwwWQQJoZu54rE6ls+bNSK2TgSksLak9YoRe6gt4cLVttcWtZX8K7NvsTWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk5qq6/jy+r0U9OR237cv04FvcYN/D0qEtOn98pjJlqhZdYcKm
	69mbMtBgnL89o70lbpqZM7IoCePIZJrjiEE29UcaFfUvtUPb5421V5JJWq5NhteH8zbAimXDzCd
	TOu795LXgeJUSgAjaaJbtmFtfaBU/1Sw=
X-Gm-Gg: AYBFou3tklPc2ARVbk4QGRZGfhVrJJ+oklQplqfz82O2jWIUTPw30EtKDe3nJy7oGS8
	9qBDSg6QgQ+Naoonl5BC5JPzaTqP8oC9pafG9le+SYDP6Um6m5Eh9LeiqPqChsNxQLrtnmJqeQ9
	6Z9a96ntAMK/4W3R0YBoGrtIhFs3lBFeLfYMuuLduA0apkJ1Hqx8ooPUoUoq4pq8sZXRTzMvNBU
	cEgA+iWRKIzEs46hbpv9pVPrMfjXYROnxaP+lOgz/iYjNDf5zYwELZngIf4yPjYLuZDXqg+/nPp
	t7rfQvDgY9AzzgTl500eSXH1S5EioWZOhD3YITqL+bV895PD69sTqZ0z
X-Received: by 2002:a05:6820:350c:20b0:6f4:80f6:6ae9 with SMTP id
 006d021491bc7-6f480f6a5ccmr760752eaf.27.1791730138569; Sun, 11 Oct 2026
 07:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: MaeeFilho FL <joaoanandalima@gmail.com>
Date: Sun, 11 Oct 2026 11:48:47 -0300
X-Gm-Features: AclHuK8IJOYpso1HhSgXW104tnmReEvrVU3sXstVSoTDmAtKD_QfWoBZxJyM9Ww
Message-ID: <CAFA5sMdbmqyqPhQ7Bqayd4-PBbA6RGHxgy7kFa_uF7mJWtFDLQ@mail.gmail.com>
Subject: Re: [PATCH] lkdtm: Add more EFI runtime tests
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ard,

The Code is excellent. A few points worth highlighting:

> Two bugs were found in the arm64 EFI runtime support that weren't caught
> by LKDTM. The existing EFI_RUNTIME_CRASH test instructs the firmware to
> write to kernel memory that is mapped read-only, which usually fails as
> expected. However, this does not exercise the runtime mapping logic in
> the kernel, nor the fault recovery logic when the faulting address is
> inside the EFI runtime memory regions itself.
>
> So add two more test cases:
> - a write to R/O memory test that uses the firmware's own executable
>   memory as an output buffer
> - a branch to memory that is occupied by the firmware's runtime services
>   function table, which is usually mapped non-execute.

This is an excellent addition to the LKDTM suite. Forcing GetTime() to
target efi.runtime->set_time is a very clever way to ensure that the
firmware page tables are strictly enforcing permissions over its own
executable boundaries, rather than just testing general kernel mappings.

The execution tracking via the anonymous function pointer struct conversion
to trap NX faults on efi.runtime data object is also rock solid and properl=
y
exercises the arm64 translation tables validation logic.

Reviewed-by: Jo=C3=A3o Guilherme da Silva Freitas Lima <joaoanandalima@gmai=
l.com>
