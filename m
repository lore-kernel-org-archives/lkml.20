Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794674999;
	b=j+MAWlcjVQ0JTgegR3e+0cKwDkZwDS3Jna614VSFLEEDfzsV2+GtU2uK1ThkvBqoJuaT
	 g3lg0TP1VgwNgal8Xid2TLOusl/Eo+GjgaAY1chuL+o04Lw7oxe6qOj65VRqAFwqSBO/s
	 oaqjXv/fjsNOHny+A7LWAlDS9HsCMv+335TmVeqTZE3M56exKr+VwSuvk0SoCntEZRBmG
	 lNWQjc91pBIyQilhhGRgvqxlwL2fnZ0xZikqPpVULTkZYb6pkAGo9efEoditOGU25nI3C
	 2Hv64OVYF4F5c+u1T0fr4lFA6nN1AJ/XjQbSszVB9XKnQk1VDWYwneZAsdt8RXSWIyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GUFPtUc78Ff2nzctbKPfIz/d8+p1b1chHezhK1s1XBg=;
	b=fDIjinsIGEFpEaAUNQRpKbubbhKV8OhOR9xhqZsp5Tw5aqddJCH4mrR/XyeCdLY9bJmo
	 VLL8Vbmm2aeNL6X2O74G/KEp/qzMdBnai6UYOgPfNc1Hq1y94qFJGnwjnCquc7j8HonqL
	 i2pMbnQ5d0lRkwfVQRRyvWBPuEG35Ymm0tgwxpdyJqkRgiQCQ1vJanvGBYihXhvSgC8Ie
	 jpoNOYWBpbB4IyvF41Em+wxHldqks7hMlVE8L1LXUsIekt6J6JOfdHHSifnEO/ZyU5bMA
	 iOBElAvRxQhjb9Reoa59rvrlqtjgpQnfoeHBNF+gJd4PDew4vVnqPrNc2YxI4TDb1Ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QT1ksmBZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59814606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59814606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QT1ksmBZ
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37198ed3727so3493918eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:49:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794674998; cv=none;
        d=google.com; s=arc-20260327;
        b=a7iFbTBhIfmbZqwZbg6Q5I3ZBjENBECrc/rVXsJ24a+A5bFzY/IXes+d+ZhNjqY+lz
         zXbompJXbXQf2fQ+I/WrugId4ehl8SXRQZ5h0/B+teYrI1Ub9kEzGgA8JjRecE04BXY/
         +MQwqdBaMtPGUyG//2Rq2yhADbaDCy0dIuT+pL7bJtcROwSHBbFYN9Rcx4L35BuklnCs
         M0vH6CuxDPQQ/HHYJqC2oRb8iL7l6KvcMl1fqJIOCyh+oqmo7sFHkXpCLGe0UMpgHcIn
         tDOvXde+rK7IvbyiK9VqNBy+fFW1mZ0vyZFl77mM8mUt031dpZF3RAqgLzN0h9yb2WK0
         sEMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GUFPtUc78Ff2nzctbKPfIz/d8+p1b1chHezhK1s1XBg=;
        fh=jlhfdQkaLGSLjHEgoeGz2hLnqaENjVkBte0+hh1zGBM=;
        b=aYrVdV0RV6c8hH2Db8qEsrtv3o3yYCi8gipGuD4Mzu8TGLNJ9SX9w43nHYGgR8+HUY
         F0f9ZVEMJ2Q4wRIdkalNWpTaKDmSYz/pOZlQqrnsTsjaVQcUdIAq6n/xCOJ71lQJ3O8+
         9o58GBrgYzVFRTRzbGnsUD/n+J0gcqc5IOHf8u+Kk/n5cxAYVWkPEDoO6Dyeivh3JeOt
         75ZCk2qxra5FAwgW1E+xk+/kdyqNKH4+5yB+SRylhHwGh55AtzjmMeJpKwTS/cp8VOcd
         83NR6741mirFp/ijMbh474E1brdv0/vmPEI9zErTE/z1msgwOAToZT6UW034W4Pzz1n7
         u7DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794674998; x=1795279798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GUFPtUc78Ff2nzctbKPfIz/d8+p1b1chHezhK1s1XBg=;
        b=QT1ksmBZYJTHxX9VIlJwOkYoAstbMSNvCaFil6h6hB7coI8Hw0/trYb8/BMFP8L3fX
         VQ0d4Q5KMWznywYHFZYnXNMwytK/r7aSnoBfBAdgPTXmUg3decfIcPro1HNYaTmxGDfQ
         XH4FayJY8UfjC2uS1WGGz3AqQcrezsGeq/dq48l/RA/ITDWvOiKJU1CmXJ9fKeaieLOk
         8NdEcmr9lMQCGiFdEAdk4vxnGuGB5epLM8Xx03pOaJBMTvLnPmle54txUURtXFHl3juz
         61QIeBAEt2A22ZWotJwrWFktgzUwDphy1KtsGoj/B87AAJKWW8EL647xaEu5Ps1++/N/
         W/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674998; x=1795279798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUFPtUc78Ff2nzctbKPfIz/d8+p1b1chHezhK1s1XBg=;
        b=Yb9eFHoMp0uxB19RDA/2NRYwPDGXdywXIU1w93xkOsDOl1ZNEpNilX6cilaeDQWxGp
         tuPbS5hTMTyl2GHgXNX3hn/hecGeJW6L79H9l+xTm5G5LoFUJ9jf9N7kNsrbzlPMHkZ6
         Acewy56EeG92dqgxaglZlyI/jVZpcaYJHeOrM6hP02KTyXNcy4w+fMKE0kaSbaLH8XCr
         8OKLBOvwatdh27Jg2kxouDSIOEk3Nhat+4SIo1CdqZ8yRRGVFAnJu2o02oIHW6R7G+Xo
         XJNABvBM7bOmsi5i+OidFQYn2JoFOvWKMbcpUGrTqavH6LeAVjd1ILMmmjPBjneHnflI
         0mKA==
X-Forwarded-Encrypted: i=1; AL+hErHSxcBxNVzDfNFge4ViG/xA2dot8SH2vzAdOx78tIrfMxxaZmfFSWIqkgT06jazMX/yOdjrCEpSdfJh3xg=@vger.kernel.org
X-Gm-Message-State: APuU4Z86RUpFhP/SV4254oE2/Yd+VqE/vZomo2fJeVrzv6WYWwGaNUqr
	qZgMCTACCbzFETN44gYs+XKl695VhnAzprsIpmw3+/6w+1QkZfW27JPmGJcufgsqPyPxptNWNfd
	PRRlSGiw2fSoyvCytt9J+73Y9nVg3q59KO0OulCE/
X-Gm-Gg: AYBFou1tlyefFdkqSjAIyBEkaKB02SYHO4go00ZaP3cQD8cUGHCcl+B7Ues5g3pqSd/
	tJaA3KHHNScIGrE2BQhhyCGLaMUygBCCjRHdLaprrRTz62iGw8GN2KbqeOzaJizo6sHsxyDIcZn
	TyTiLA5ftu4kxy1bpE1kNSl5LOTjex10abVN5gDDZUJsopfI3c5yxqqKNs4ugdsowaJFuyXmP4q
	28UqI6q/A+ZVJMX1i6CPwEns0HCDQVNkUOW+4einfHnXYkLhFibwT7T1xN6g9jSt2kUZkMepXLx
	wVV51hBWQ+Fkymu/2WuyFKNT1tEqMeUEAmVFJtbhPoHPdfffOBMOqMI867e4pOpzQvrhZq8al+a
	216Llbmmu4OKZcW2qqUQBWAK+9gwu63LFqZ/Il4dIHI7/YJrzU5i3izC8N7GNBlHg9V4DV2En4N
	EZqY4CU6iBNjKtiB4gDXsa7gNVwEFmaokr0B/WYDczzLgQINLmO+54+lcPtY0nM4pgE4c+WGYQY
	q23NnL/ZQ==
X-Received: by 2002:a05:7022:3c0f:b0:143:808b:b178 with SMTP id
 a92af1059eb24-1b4f5f93ca2mr6484146c88.26.1794674997531; Sat, 14 Nov 2026
 08:49:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114162632.16346-1-sidchintamaneni@gmail.com> <20261114162632.16346-3-sidchintamaneni@gmail.com>
In-Reply-To: <20261114162632.16346-3-sidchintamaneni@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 14 Nov 2026 08:49:45 -0800
X-Gm-Features: AclHuK8e2NpHhPJrGzHc56g3dEpZLqRfkrJ7tU89mCr43OpsTZY4kmX_0Ds9uN4
Message-ID: <CAAVpQUBxBDe6kwE_0nKcjnNyfH8_DgYXC99xP5-UATpGn36Vhw@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] selftest: af_unix: Test scm_fds on dgram disconnect.
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Kirill Tkhai <tkhai@ya.ru>, apais@microsoft.com, 
	hargar@linux.microsoft.com, rlmenge@gmail.com, egoriluk@gmail.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 8:26=E2=80=AFAM Siddharth Chintamaneni
<sidchintamaneni@gmail.com> wrote:
>
> Add dgram_disconnect_fdinfo in scm_rights.c verifying that scm_fds in
> /proc/self/fdinfo/<fd> returns to 0 when a connected SOCK_DGRAM socket
> with queued SCM_RIGHTS datagrams disconnects via connect(AF_UNSPEC) or
> observes a dead peer in send().
>
> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
