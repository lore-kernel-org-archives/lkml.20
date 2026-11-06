Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991482;
	b=gRgzZVuEvUjTk8rF5XBj7C0DKpEhOCwNAdoeqkvQNOBQqBLFaoKJBuVj1sWXefzl6q76
	 QelkQWOdCn06F0haP2cW19CjHEfG3sMAbOYixYmB0lAiLPQ0pRMPWi1YB74VryyHYcNpr
	 4huYwkMdgCAA94SI7Yv+H2OGWrIYZEgXpYw9pS1mX7WQScVAQ/FLPOBT3pXtQwN1Y4TFH
	 anG+jH92hOqXm07A1EjDoAEjniGElhM0RH5hP5X61fFKqUYeUjoRkU+TrypPlGQe8YXda
	 uTF+rX+6+2nTnT9+XSPr+dyPUWO3Itj1k+I9X1k9799U1WAREHrWRzsI6RHfGq2CXgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=/MMk4dpDTUnL+JeGvHAKWol8stlyFONQgS4qXzOKLhA=;
	b=s4tIghDi5j/xeBpFi6ycjfBMdGBxF/aaY6f92Q9SjLlOGHGYZLRFtu4qLXVSUKpOdvkd
	 iXWEO4CCwBIyV+6wCBNs3dA2HbHJXEVoNBKimB6Q07f5u2jjUFTJU7UamUlViyknKBS8V
	 LPhtBdh+jWJzwoeU5LvQn+jqm0d9L6YoHqweiCh/yWJAcv0P39rBHNYeJIkOUm/7Z0N5m
	 /kzTCzi+rkGhzItvjUosaFrA4dk2Z140XnYM6VbiEXN4jj0QJ+a7RxqF7zkG4ixVrB55k
	 G7c9+bRP6WEm3eccQfnR0dF2+woM4elYzCTsKDTqmSNY3Lvik9SE9PZYNU/Ap4k6NaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2dlm1z7;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F4D606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F4D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2dlm1z7
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9440304604aso110692485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793991481; x=1794596281; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/MMk4dpDTUnL+JeGvHAKWol8stlyFONQgS4qXzOKLhA=;
        b=g2dlm1z7R8dRmnPuJheXLtnTivnrhc+b2GrWjANEhjh9Ksp5Mr9TfeuOSWzqgp9kZz
         52cHo3yCTgNEqmD4dDy0mY7KMi64/zBtcjCerYQTcWedSg7ggnGF2oowk1AMZJIVRo6O
         2Qhg1pUHAtyWFMrib4mmJ0Mkc/RhcjTddE8NtA0q99cgq5Blq3A6oo2laEYQyKwNJUyQ
         547EOet4UgqoLGR7NjgVu7HEHpc0Vqp+tGr0lHMgrj9ndfUh0/BSEAQhHypbq3hvPcS6
         TWO0Lt6psS2GXpI9XZye69soOq9Nu9Y6Ywn/SQlSirhsK70U/sth30l7aamOOhDZga8+
         eE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991481; x=1794596281;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MMk4dpDTUnL+JeGvHAKWol8stlyFONQgS4qXzOKLhA=;
        b=B/IspS8T53fcs9RImuEJoTaoFunHeYvux0pjh2SEiW3zMHb02iJ0WsoXu9YidcX6QG
         vbnvUDBeoclLo3jzP69OkxXpE3eQich6yXwEUHV8AJEAquAf9J+cze2NYaT1hRyzF7jD
         s69x4jgm8eaAxg4RIUGBme9uxDGyIF7wJD9t1JOIvLcPSixheq+in4sadRDKLayGCuDN
         jnC8vWH1iEzarjavnIjJ9Wx9UeqCUwlWkVUR3oqw1/Bj2O+bjThOtOPd4H20huj3byuM
         edjEZwElHHqxL1BKchplYMrvq/OUz0wTpMjUIBliRMoe+eRRktnIfZvzh9dl08Loh1lb
         zMVw==
X-Forwarded-Encrypted: i=1; AKwUvBxySsqyDTu8PZppNuTJ5qOjVmB6mmCTgXz655E767uiLY+1VbmXKqmpr/rsEc5kQatEaUuwyeHzSDUtNoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fkE6VYomNDsX/YXNBFBYux22Uga4pu2pyB0MKj42+w2uyV+jF
	lWukuHTBq7dVZp00f4swfuLGb188lUmmL5LFjIDv077nXhEA/T/9riCW
X-Gm-Gg: AYBFou02HRD2yCJZ+xosfOoBWC7lVd7wBeSuulxPd3xNoeE53Y19A6Xa6bv7jNNvbkJ
	/DV1Kn0vNE73d0AHT3vgcQttvYTx5L62ogrQuTzm4IEZv6ntucSs/w6ZWcWfpChhaT1Vh8BANY0
	0Kg925hb2I24Vp9KQROL9GF/h6GxKoCIJNuYvTjcbSXxNs4J3AlUOoGuEo1oCJVdaHsgJRIWy/w
	GYJ+Y+zgUQJp23ma5qP5wV2iuYwM6eFZ+L0C1z8p9OlPyFbn6vEyehqpmd7gS1bSJtDVYcBMP5u
	BCRnEpggd55IrN4XK9gVLYj6zp4lM6HLBB7nZFy5IFYb084Rtr2hcwAQaNMRrt8ul0OcwKIBlW3
	wYtXTs14Eqpxa+WRs+fSez+miOydHbfdTjCgxZwCzGucIDegGpP2spd8ulkvG2/Gv8HYTX88oeh
	xTFJ77SmdPEmZjqJnS9fExF4oJhWU/5uAZvOH8sj7sVr8f+Yn7iPoXBqlozRHYmCV7iKOfbiAWJ
	jGaC9qxfj9i7PCGsrfJR2UbgvSFhVJhrUnCDQZUh57VpB1qvX0uf0vL3T3VvaY+JvzoHa2tf3SX
	oBxEIy/pZ9cdbGKlhepMajXAy+SGqEzGsgJMLQ==
X-Received: by 2002:a05:620a:45a6:b0:93f:59b8:e29d with SMTP id af79cd13be357-945f3512c78mr506798085a.26.1793991480829;
        Fri, 06 Nov 2026 10:58:00 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::5:81c8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f599baa2sm207605985a.15.2026.11.06.10.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:57:59 -0800 (PST)
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
Date: Fri, 06 Nov 2026 13:57:58 -0500
Message-Id: <DMOCWJTNK6BR.3AS3IC9QSWXTE@gmail.com>
Cc: "Simon Horman" <horms@kernel.org>, "Jakub Sitnicki"
 <jakub@cloudflare.com>, "Willem de Bruijn" <willemb@google.com>,
 <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
Subject: Re: [PATCH net v3 2/2] selftests/net: psp: test bidirectional data
 transfer
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Daniel Zahka" <daniel.zahka@gmail.com>, "Wei Wang" <weiwan@google.com>,
 "David S . Miller" <davem@davemloft.net>, "Jakub Kicinski"
 <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "Shuah Khan" <shuah@kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261106182007.374660-1-weiwan@google.com>
 <20261106182007.374660-3-weiwan@google.com>
 <DMOCEM7IQVOS.I2QH7FT8FT8S@gmail.com>
In-Reply-To: <DMOCEM7IQVOS.I2QH7FT8FT8S@gmail.com>

On Fri Nov 6, 2026 at 1:34 PM EST, Daniel Zahka wrote:
> On Fri Nov 6, 2026 at 1:20 PM EST, Wei Wang wrote:
>> _data_basic_send() and _data_basic_send_netkit_psp_assoc() currently
>> only verify unidirectional data transmission from the test socket to
>> psp_responder. As a result, they do not exercise the receive path for
>> PSP-encrypted TCP data segments arriving at the test socket (such as
>> packets redirected across a netkit interface associated via dev-assoc,
>> which relies on SKB_EXT_PSP surviving packet scrubbing).
>>
>> Use the existing "data echo" command in psp_responder to verify that the
>> test socket can also receive PSP-encrypted data from the peer in both
>> _data_basic_send() and _data_basic_send_netkit_psp_assoc().
>>
>> Signed-off-by: Wei Wang <weiwan@google.com>
>
> Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
>
>> ---
>>  tools/testing/selftests/drivers/net/psp.py | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/=
selftests/drivers/net/psp.py
>> index 473500901879..c114d2245135 100755
>> --- a/tools/testing/selftests/drivers/net/psp.py
>> +++ b/tools/testing/selftests/drivers/net/psp.py
>> @@ -120,6 +120,26 @@ def _check_data_rx(cfg, exp_len):
>>      ksft_eq(read_len, exp_len)
>> =20
>> =20
>> +def _recv_careful(s, target, timeout=3D2):
>> +    """Read exactly target bytes, tolerating short reads"""
>> +    data =3D b''
>> +    end =3D time.monotonic() + timeout
>> +    while time.monotonic() < end:
>> +        try:
>> +            data +=3D s.recv(target - len(data), socket.MSG_DONTWAIT)
>> +            if len(data) =3D=3D target:
>> +                return data
>> +        except BlockingIOError:
>> +            time.sleep(0.001)
>> +    raise KsftFailEx(f"short read, got {len(data)} of {target} bytes")
>> +
>> +
>> +def _req_echo(cfg, s):
>> +    """Ask the peer to echo, and check the reply arrives intact"""
>> +    _send_with_ack(cfg, b'data echo\0')
>> +    ksft_eq(_recv_careful(s, 5), b'echo\0')
>> +
>> +
>>  def _check_data_outq(s, exp_len, force_wait=3DFalse):
>>      outq =3D 0
>>      for _ in range(10):
>> @@ -478,6 +498,7 @@ def _data_basic_send(cfg, version, ipver):
>> =20
>>      data_len =3D _send_careful(cfg, s, 100)
>>      _check_data_rx(cfg, data_len)
>> +    _req_echo(cfg, s)
>>      _close_psp_conn(cfg, s)
>> =20
>> =20
>> @@ -726,6 +747,7 @@ def _data_basic_send_netkit_psp_assoc(cfg, version, =
ipver):
>> =20
>>          data_len =3D _send_careful(cfg, sock, 100)
>>          _check_data_rx(cfg, data_len)
>> +        _req_echo(cfg, sock)
>>          _close_psp_conn(cfg, sock)
>> =20
>> =20

It occurs to me now that we could have just changed the key exchange
protocol used here to have a psp encrypted "start of psp" message that
each side sends and blocks waiting to receive like psp.rst suggests. Not
worth respinning, but maybe a future cleanup worth doing.
