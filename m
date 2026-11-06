Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990076;
	b=GtNRxIujrMER8wYhmjMcPXgIgEjdrWLgzAOkp8/zpJaziPOXjvyIS5xpfLxKNISB/nYl
	 2roCVHRsvpMxQapX024B9jV5qwwipUW1jV5BIYXxq1lXqhnon9bSc2+wioMWTDggMxHEe
	 nmYVzEBRSBhC2adJ2i7+tqF6bZt9QKe6TqOtVp10UCW038YIjGuVRfUkVsWMFjbjMPEXh
	 WW1SRcDmJqAfzpAFf0jG83xGm4JrW3tqsPG4d3i7bSS9YXCJSwWt1KnZ9APVBXQir82JF
	 ir+uHDp1yy64hOv1yvXiT6FP/hrINMGaiL446p9pL0B2rHOCAjkxMclgYXfGhN8Qbpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=+c0xWdkkcKoTE4Rdj27Yc3MLhE6rmfRXOfJT2CGVuAQ=;
	b=IRcDg4LybfVGrPDZ+DTZH+T4vBMBsdTTyjhKf1HL4ZAj9pbQQfV4IldDhTOabTFO+a+z
	 PHr9Jqg3a/GM+Ag2IodyJuletcnAtPTo3MlNOGYeKtQa4VSCRQUzjEH2uTKKkc2ngacQQ
	 nWbi4hkxPp4AZvVB6JALzmZzrUXfa9qm2/GSbVhFR6FDWSHPa9gGqjt7xkq2PCj1U02iC
	 ufidNPCWwpauK4xQeLDh1Z8acVp5KEe+1TJ/Bm1M3jXmhzBEBYDQ51gNdScLOCVgdAX04
	 mfWv5nB6ybrdzwrF6I3qx15QIsKPa1lqsDjYJw1PjEvzQV2NxKHvApIU5ikFeqzu4zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=azEJaddf;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC8C606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC8C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=azEJaddf
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91ea5600c9cso12444916d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990075; x=1794594875; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+c0xWdkkcKoTE4Rdj27Yc3MLhE6rmfRXOfJT2CGVuAQ=;
        b=azEJaddfPLszRG2YEd8X8XX3QNSmADkhMqqQkz8WJCqDHCX/yElegKK2JUmNUFCVFn
         1m9uk2k/p4dq4w3fJAA/u/LJ3eU7HusdduRCkLAdoeLqlRTmain3Uqa0I68B02+FRZjN
         iz+KKvNA8NWhZE+WAdsdD77VmTCugNNKnPrerZfcB2h7EcelHiX5fEb4Rx1oJuYFUAkl
         nqZXZGuHeNLKXtxcXQ2MZVRcRDisv+8FiLqCpkzml5h6bYhW6O6CeuCKbMBPGtv4XmJK
         Bp4PO2afCpZFU6DuKRKSo4n/5AT3FCs/rRv0Vms0kdAB3NGupdnhqglYZoGMUaE+OrJ4
         yZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990075; x=1794594875;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+c0xWdkkcKoTE4Rdj27Yc3MLhE6rmfRXOfJT2CGVuAQ=;
        b=YuMTZEHxRxaKD1nkyqaaaVTCZ0e1ZrS8BMGHMv91iNJ+7NMq3VPdBb6HCd4YefHndh
         wo136wW9YzDSJCJPgXXpP+aPmLbfy9FpcpbvpSB1D1kTNZk8OuSlgwBLmTIId5DJ1/1q
         nez0vd0l3Yd/ReDDmwGo/FJpqtX+8hAXC06gcYsDotzCw2l1hOEPNs/H2SgRVKS+87Dy
         ds6a32AetCzb5VMi9zxzTCUmXSndhgP+F4bwEVWtdrit6cpAA182zJhBJmYOIxYfC/Tg
         Valafdl4lwvMhn53m5aXGG6Lm8F/p6ayZOFxcxyWClBdZuQR8oxfaw00jDvborJiT6AQ
         CI/Q==
X-Forwarded-Encrypted: i=1; AL+hErEzMtudiotUtPVhPxBAZhTqFTAV/M4j55cpJp9wAxVH8KeZqJZj22c5r39Y61qxSY3IsDulezXpjk1BiiE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pgqLXMsiHwXkZGEdbOgwDJQohxc1ykPS0WgUsDCkWYOohm3Rh
	WalgqLTNooGFKd6zU8POqEXiaODbCub00RLWmT4NfbT/2sACaSah7zE/
X-Gm-Gg: AYBFou2q4HcKw5Phk32ZLyVBcEb80htspcOgFblmkSrtv5H0GEn3FZc86Tb2WAv/sY+
	LBMajHxNULYIYDaKbOyNIWH/1OnPtMIattU9VgdFRAwOUwvjvb2wUrYhS6IQA+NBfVCmMD5TV5Z
	DP4fe4pKtUZ3D8/B+12pdpcz6Sf/jSHzwmSt+L20MSC8iZ5UZE/ZJ/+Ztm7v98QMZN1lZUP1buJ
	4dcZ15ADaYCkELIxP5Ss7ToWJ97SFgCAhlhHeVfCsWDcd/OqTJWD+7+zkWGwMasunInyGw/lSZg
	NCygc4sOAcjgoUvFOWdXze0XWgnQCAtWoU0PY5jdaxVp4v233e4RueMI9JcWqez0eaFNLe8zkg7
	4ng0mSVfolCqrED54KUEqtTYe48WBWajJ+cQHdq6VLfsDKJSnaO0tMoRn4HISdFe7IVcxvlxlDN
	6TMHwvjT4/hUdouMmAeHH0HwxvUPJgWLvqJOjme4khl9B1KrHYGZyXZfEV5JgGKZ+Q0l1kIaRpw
	nhXWEziivfLWQW1JAWcNLF+x5zjwTiBOot6Fud0CjRZTMiP1D5Xv6Pw/GvIiYY6VBApYf8zdEud
	PLqaADJF6esVMJ8qOg==
X-Received: by 2002:ad4:4ee7:0:b0:91b:bcf5:a733 with SMTP id 6a1803df08f44-91ea9304f4amr50544826d6.2.1793990074822;
        Fri, 06 Nov 2026 10:34:34 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::5:81c8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6900b00sm26542996d6.4.2026.11.06.10.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:34:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 13:34:33 -0500
Message-Id: <DMOCEM7IQVOS.I2QH7FT8FT8S@gmail.com>
Cc: "Simon Horman" <horms@kernel.org>, "Jakub Sitnicki"
 <jakub@cloudflare.com>, "Daniel Zahka" <daniel.zahka@gmail.com>, "Willem de
 Bruijn" <willemb@google.com>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>
Subject: Re: [PATCH net v3 2/2] selftests/net: psp: test bidirectional data
 transfer
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Wei Wang" <weiwan@google.com>, "David S . Miller"
 <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "Shuah Khan"
 <shuah@kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261106182007.374660-1-weiwan@google.com>
 <20261106182007.374660-3-weiwan@google.com>
In-Reply-To: <20261106182007.374660-3-weiwan@google.com>

On Fri Nov 6, 2026 at 1:20 PM EST, Wei Wang wrote:
> _data_basic_send() and _data_basic_send_netkit_psp_assoc() currently
> only verify unidirectional data transmission from the test socket to
> psp_responder. As a result, they do not exercise the receive path for
> PSP-encrypted TCP data segments arriving at the test socket (such as
> packets redirected across a netkit interface associated via dev-assoc,
> which relies on SKB_EXT_PSP surviving packet scrubbing).
>
> Use the existing "data echo" command in psp_responder to verify that the
> test socket can also receive PSP-encrypted data from the peer in both
> _data_basic_send() and _data_basic_send_netkit_psp_assoc().
>
> Signed-off-by: Wei Wang <weiwan@google.com>

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>

> ---
>  tools/testing/selftests/drivers/net/psp.py | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/s=
elftests/drivers/net/psp.py
> index 473500901879..c114d2245135 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py
> @@ -120,6 +120,26 @@ def _check_data_rx(cfg, exp_len):
>      ksft_eq(read_len, exp_len)
> =20
> =20
> +def _recv_careful(s, target, timeout=3D2):
> +    """Read exactly target bytes, tolerating short reads"""
> +    data =3D b''
> +    end =3D time.monotonic() + timeout
> +    while time.monotonic() < end:
> +        try:
> +            data +=3D s.recv(target - len(data), socket.MSG_DONTWAIT)
> +            if len(data) =3D=3D target:
> +                return data
> +        except BlockingIOError:
> +            time.sleep(0.001)
> +    raise KsftFailEx(f"short read, got {len(data)} of {target} bytes")
> +
> +
> +def _req_echo(cfg, s):
> +    """Ask the peer to echo, and check the reply arrives intact"""
> +    _send_with_ack(cfg, b'data echo\0')
> +    ksft_eq(_recv_careful(s, 5), b'echo\0')
> +
> +
>  def _check_data_outq(s, exp_len, force_wait=3DFalse):
>      outq =3D 0
>      for _ in range(10):
> @@ -478,6 +498,7 @@ def _data_basic_send(cfg, version, ipver):
> =20
>      data_len =3D _send_careful(cfg, s, 100)
>      _check_data_rx(cfg, data_len)
> +    _req_echo(cfg, s)
>      _close_psp_conn(cfg, s)
> =20
> =20
> @@ -726,6 +747,7 @@ def _data_basic_send_netkit_psp_assoc(cfg, version, i=
pver):
> =20
>          data_len =3D _send_careful(cfg, sock, 100)
>          _check_data_rx(cfg, data_len)
> +        _req_echo(cfg, sock)
>          _close_psp_conn(cfg, sock)
> =20
> =20

