Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106791;
	b=J0H5aRZaViHj7ifnGdEGr/iZpxFApvt/pua9P88pkLSJGxCIfhs7HmC9UftJO2Rycd2K
	 HvoIKI0oA2KdwtiHyWo+2Z8I84nWtV/+ckCwsolQzhLtsjWhgmdYd0OzlMuVlbDAqyK5Z
	 ISDcnAkGm2BI/ZcsA+DoJkSb2oJwQ9zt7wiiy36ZFh71A4SDHSZ5Ujf94mYb3q5mUKPL/
	 AvOH19IDI7NEhK99X46CYS95vBIbReYLbJ+pdahgL+E+14KQYW7K+qX7X9TanoQbgA4+g
	 Zal1jp0JVXTxwrjoUEpPv1abQ2VnajTyL9wlpnaDQORhUYQinkODj1iL6wuFww+f4Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=NLb4nDnDa6CheKrcmNiCI0BRgJPIlEmNmuOLfa1pfGM=;
	b=ro/c+0Okv7V6RUhirc+JSEMoaIiRxymqkoL/lTERjQOMNoiztZRS6oFpMcPOfDIKM6tf
	 OcatJ2FXw6GqxK/57Z/odorFb+CJhRz52ADlJCPFzKs9pz6p7rZP12t2TeOOQ+e/mQUVp
	 CVg/pAeRDo6zRkMRcNrg7ynSPPO4zFGkArRxVUxZrsaSpQx9YBZJpAFfTHxNMjcX/0Kmo
	 8prvrz6/TiSOC9cKElXGMG0QrjuQlUbTWmWGN7MUgUuqHy0SqYzOVWquRAmEBgau/f81i
	 7QT8BHkiKo5h8ImwxifC5a40/NSe0uYw0C76J66+rQ2GIIY6bU1WPCPEwcOj45f2KUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GdQnafCf;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1346606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1346606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GdQnafCf
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a17a332ecso569589eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793106790; x=1793711590; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NLb4nDnDa6CheKrcmNiCI0BRgJPIlEmNmuOLfa1pfGM=;
        b=GdQnafCfs4JjE1bf5swyZn+lUdfkEWIe19XaOfaI/jr6nZJrRlM6EDaidtXyggEWzn
         z6mqlIb+cs/xO51JFD+8ZiFR2wAQvf8Dlrvh7feSj/iyZtu5rSvjsX1g3WFw354kr6BK
         4DcL4gBDT+Er/iQ5G3sLJbNJeWLJYv8+4YD5JrZiUDT9c1qaWkCG5dWJp10g1rfT4x6R
         E2ncrHWrcjzOo+gNaB82xl0fyCHWwBzbmGDop1K2JWsasCX25ZRdaDtihYxiOYWIjtSi
         Oo0KW0aKkdsirAuAo4RnGtiqb7evofLpBW4k3c4W+XIT7MgRamX9jVfkGGbLyvFVfEgc
         8Qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106790; x=1793711590;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLb4nDnDa6CheKrcmNiCI0BRgJPIlEmNmuOLfa1pfGM=;
        b=irYTywd4XcZ8odwwwSU/JvBWmrCM8SygTu6o8gGnJMoGzlVXcuKFB8wDoPgPB9BLGB
         JiH1HTiDe6H2XkUwp2cqgHTlpyXsxp7oHFEx5Q+AUmz6+OKoa9T60CaIkEYWYl8O932j
         VefMxkctv7UwkioxNMPmGC2O4/tQZq+DQgCRrYYfArUa6I0db7Oi8m69VTaAfQNn61Ax
         +Cf9DbvR7vs7rBD2V3BDyiZs4knsWCeh1qej/lJkOXUbMcZm+FtPfxeNBXYmFOAJ+W8f
         XASLWYh9+C0gkBtTElZabbuwtW4VIdY0BrzyjJmiFn36rqjzi4auYJD++N6buTUp8CDV
         MDcg==
X-Forwarded-Encrypted: i=1; AKwUvBz+5IhrkzCcmeHbNHOeZuC8i8FU8Z+y/DM7oI+IWLpamxejGozMX8cYFmf7Pr93/M+SkoB47dztM+zH/pQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6P5Ll8MC3UbZEkkwPwPe8K4BS+2Yb3VYrA/Exc5QfcQe+7EiV
	FlNlsRT4J+xPU1694hVBimC6bZ1/TEILQWuJFaOeMWsk7R0fC3m8kUAs
X-Gm-Gg: AYBFou0+Rhm3haSKbwQO7PFHBrjo/tO5VZFXR+v6kphwR5jCDHZNFZCJzDQenZXWE8u
	ey3RzDIF+28cLH20XHP+NxjO6VyrwdCEjzRnSQqmTkwbZILR2d+GlQocb2gRl+O04uTP2DY7XvP
	Kr0NtwRKha7Odx1twn/TQMMAU3JmdQDraztdgkHH/2ZWCF5bRq25dE23yvkTOEHa9LlqOdbPXGh
	Jbt5qPDoM2O5IIIJ8+bIQIyTHXf32jy6t63cnR5Sj8gEfjxEkCXK+eJJkOam4+aLXXxwYUM7/l/
	vu0126vNvKHEUDXnbIpaWJBk10Crigp6K5HHueALeGPyFgvcQwqF0ZbKdNjB5A4eJ3SBJgKFDOx
	q7flxh6eJGayVUWhPiu3+Ri4q6iXE9naFGgtKD6D/nhq/y1y1VnDqaLO2Go+txfsituzvSlXTaF
	oUZIG0XalAvNjiPZzJGgseoywuBUgNRNe/YNDWKgw6jqr/uhDGSCzUukaUWRfQoQ1yht0jA1W9L
	eCms1AQSePTB2QcDIGXqFF00uxyE3dFpve1ZblNdas88WCwFYvNDx7iSzuwac/iIii8WKAJfYK0
	ke+QUyvEBp1j1hHloQ==
X-Received: by 2002:a05:693c:88c1:10b0:367:5e31:ce29 with SMTP id 5a478bee46e88-369e84fe37emr14011879eec.20.1793106789881;
        Tue, 27 Oct 2026 06:13:09 -0700 (PDT)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a002a486csm19339403eec.22.2026.10.27.06.13.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:13:09 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <CAL4Wiip=TkP2hmOFR-1Y-CU4rYHY_q=TBDhK6RmTj9UEMQ95Gw@mail.gmail.com>
Date: Tue, 27 Oct 2026 21:12:52 +0800
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
 netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 Shuah Khan <shuah@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <D438C59D-09D4-4008-9240-18DA0ABBDCEA@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
 <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
 <e25fd292-5391-41fc-a324-0ec260828415@linux.dev>
 <CAL4Wiip=TkP2hmOFR-1Y-CU4rYHY_q=TBDhK6RmTj9UEMQ95Gw@mail.gmail.com>
To: Eric Dumazet <edumazet@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

On 10/27/26 1:45 PM, Jiayuan Chen wrote:
> This precondition does all the work. The server only learns the PMTU
> when it sends a full-size segment itself. [...]
>
> Please re-run the 6.12.107 case without seeding the PMTU.

You are right. Without seeding, 6.12.107 stalls the same way:

  kernel        PMTU seeded   SYN-ACK MSS   1 MB upload
  6.12.107      no            1460          stalls
  6.12.107      yes (ping)    1416          OK

My reproducer took a shortcut there. What it should have modelled is
our production setup, which is the masquerading relay you describe:
the clients share the relay's address, so ordinary downloads by other
clients keep the server's PMTU entry fresh. Modelling that directly,
with no artificial seeding (cliA downloads 1 MB, then cliB, behind a
firewall dropping frag-needed, uploads 1 MB through the same relay):

  kernel        SYN-ACK MSS to cliB   cliB upload
  6.12.107      1416                  OK
  6.12.111      1460                  stalls

So I agree it was never a designed mechanism, it is the side effect
Eric describes. We have since added MSS clamping on our relays.

If it helps, I can send a v2 that describes the masquerading case
instead of the seeded one in the changelog. And I am happy to test
the net-next follow-up on this setup.

Thanks,
Esko

