Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794167332;
	b=JxYakOCa1coNQt9GI3hnxSS7nNK9eQbuWP+2F4UeB54IpYEweTZ8tcbLm77owuy1ZjXv
	 zxZLDDGZdfANdK4qaMnE4smFxBC0B5W27RySG3LTNU6GKHGgYvxIQHe3BwZPUADiRAji4
	 kgosouEx0g/cPKl/tY03nBnJ+gt2SXXXNHt/Mdr079EgLNkAk2XzVFr6GsLvEtMaxuhBj
	 Ozrht17KpLF3R4FLMVCsVwCwdA30VrW3G4qkx6BtmP9Dfnfl+IdGKHZ3I3ywIVsSzot2v
	 z78Yl86EdPiqU2eD97OEfx/lnMw7XfW76s0KrmZIG/XUH2CP8WKbsqZ9wNZHlPFIwrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language;
	bh=70zQaTidZegJHL8BTv/OZYMfTi+NPOAhkseasQT6l4c=;
	b=ghp1GzRbikVMhYHaeF3rro3nLqesC3TnmiVs4+HfQFlalKg2VhcteDi41MkUS8OAHdco
	 YnJd7ZqBtSaAHN9ZF8Khi7vEgde7gdPT4daJwZQXsAS38UciM64Ms5xaB47FSRk4ER11N
	 Y+/9f52C8xoml7NR9p3NLDACC/C4TTOoq4xk4g6I1QTQAT4FT6aWTuWRwiQ7VfY6luTwp
	 5EimMAIGcaX5EPa8W4TG+S37Gydg4Bi5vzymPACECUhCa+wwULWtQi41tpJsGmEt7ZnMf
	 8QfALMIx62cXCpQPnliy8VlTLmkURiNegotoALvC3T4C6PqDxdmQwfpLIpsAH5WxsfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXyBRKdJ;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8A6606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B8A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXyBRKdJ
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91befbcad6dso2644066d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794167330; x=1794772130; darn=vger.kernel.org;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=70zQaTidZegJHL8BTv/OZYMfTi+NPOAhkseasQT6l4c=;
        b=jXyBRKdJkp6XXvNTVIP2mXjuKPdYX1DWsFl9pcjjUplrb32KrShGQams2/5jR6g9B/
         iYuUFgoWKkSRHJlK9aABS/6k7CON3OhlRylQDZKvG5/GpLNAR5DoaH+ndUFPLzWHJCRG
         aFvjcLhjmVEuIN2jkZXDiOK4BcFmxQVMhg98YqvRxcr45aW2dKpfHNPel5FVskOaqbYv
         YGaPgrqrJM0fwl9k0MPvARz5ufMpydgf3kzHR1o0HdAV6jq579EcNHP+dDBmlYuRqqae
         XgbHIsBg3FoK7GzT/bLE35d0fYOeDUpzlcVKEcGgxPfhyT1F3gYnyiTUwZlaRXpXHBte
         KU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794167330; x=1794772130;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=70zQaTidZegJHL8BTv/OZYMfTi+NPOAhkseasQT6l4c=;
        b=q7vLu+CLi2Jxz+IZ8FM+ba6RbdlZ7z7FPWEo5egPEEvqTmJUguMF66wakqfdP2sEcK
         zCww7lX212RVkRzksn6F7p8ufGL44fK5Q8P1XW6hGQj5sc9wP6LR745Et5UZYqypXiLc
         kFaPoOdyfnEtU+iauC+99OOOBkrdRRGPhT6qhDeBSWPfzX5zxdHCj1b0o1E3YGoTxt2W
         xEp8ahfHjy44kBN4YoHYfR30InmutxqSGzNXmnVKScQJagutvRb1SbXJ9AwVWKdCljoZ
         5QMgEXlGCgTbkdYMiDgaepKzZXQzsxB0zn0g1yxvziAoZ+1W8Zsv5qhzVxvrX7spp+kK
         Ie3w==
X-Forwarded-Encrypted: i=1; AL+hErGkwJOrPx4/Iw0lZnKkhjcku6a/yVHdAOvjC8PV0YKnSYDms/8DTMVFaekEBfIXY0fQMo0cZLgofLynr1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EYz3TTPWsR3C46l6dfyxh8vE6+0upn2BjyTYAUcj2kckQctoS
	DH2T+A/79vqejMUfQZm5ZpsCUKghG1/rd4x9lq/5hPh9ogKGWXDngqtbIywHJQ==
X-Gm-Gg: AYBFou1s0HzF+OuitQ48NrHjB1kyuAVdP4aoYri/ZSDKMgnBZwo6FbkPIqQIY8vHoOP
	x/OTSzbErqIOJaoHJW6MYvZj+4kEstZA8XqjyRmvL8HF5fkoDkoXg27Y81I3Oo0YoAw7JzSjpZh
	poUx4qHF0abgwfFtSC1LnouNSWmxOcJyMqz8TkDiA4zY2CDYVkTjxPp88a8MfhR6JlGpFHcaro8
	/Jq8n7vjO6QEOOsXidPFE8SvGLPmaofgO+Wd0ZdEuYNRHeA1KgJwIOVYmIrsWhpvoUgOFisZ2RS
	+FHCRDfFwuZNgwFlmFg0wsHJkGHMYm4Q3uPckXjr7dTgvNkGm7AyVPsGci5xu8oaQcZP559opHK
	Ag3YBrlelwPmKF3OItK6M/KkmXPT7ZKl3y93cvQ5oGpziLDsUBZxpL2ejJ0LBx+Hxl4EHckcTgb
	ZvOx0nCwqxHV2TV1+FLfnIxRBlI/LJat0sXoYUaQ/nlSieLOqxGRHxE2/CSMzwqM56dUZGbRjOg
	BhEK48wFB2zoDi1JeWS+AloaRsWhdtLe6g0afwom3JM/u+k59AX9EYyLTErajlSFoNsf01M1qmw
	FIXMTi0ufsFE1epKpSdTlAurhQtw8l+pvhxG7twj92FpN/dJpTtMhVhwcVD/F+He6Sua
X-Received: by 2002:ad4:5745:0:b0:91e:76a7:187 with SMTP id 6a1803df08f44-91ed24acfe1mr32302126d6.43.1794167330178;
        Sun, 08 Nov 2026 11:48:50 -0800 (PST)
Received: from Desktop ([186.247.175.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91eced95d39sm25058076d6.13.2026.11.08.11.48.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 11:48:49 -0800 (PST)
From: <brianrobertjames@gmail.com>
To: <westeri@kernel.org>,
	<YehezkelShB@gmail.com>
Cc: <netdev@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: thunderbolt_net: GRO header-length ordering defect on Proxmox 7.0.14
Date: Sun, 8 Nov 2026 14:48:48 -0500
Message-ID: <000201dd6fba$2c726e80$85574b80$@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad1vuZ0ajLhI60pVTHeHwa3vcNZzXQ==
Content-Language: en-us

Hello Mika and Yehezkel,

I would appreciate your assessment of a thunderbolt_net GRO ordering defect
observed on a direct USB4 link between two AMD Proxmox hosts. We have
receiver-only original/corrected/original comparisons and packet-order
traces supporting the Ethernet-header/headroom correction already published
by Shun Li.

Credit for that prior published correction belongs to Shun Li:
https://github.com/riverscn/thunderbolt-net-dkms/commit/b18a196bb5ca54246443
e1a29924d6007aa16036 

We independently investigated the same defect and applied the minimal change
to pinned official Proxmox source. We did not install the project's broader
DKMS/RX-normalization modifications.

Tested environment:
- Two AMD x86-64 hosts with one direct USB4 cable; native thunderbolt0
traffic, no bridge, VM or Ceph in the path.
- Receiver kernel 7.0.14-28-pve, #2 SMP PREEMPT_DYNAMIC PMX 7.0.14-28
(2026-11-02T11:54Z). Also reproduced historically on 7.0.2-6-pve.
- MTU 9000; TSO/GSO/GRO enabled; gso_max_size=65536; unpaced single-stream
IPv4 TCP iperf3.
- Stock thunderbolt controller driver unchanged. Receiver comparisons
changed only the network module's header/headroom metadata. Cable, ports,
offloads and CPU/IRQ placement stayed constant within each comparison.
Secure Boot remained enabled with signed test modules.

Receiver-only comparison, original -> corrected -> original, 20 seconds per
arm:
  Original:          30.599221 Gb/s, 620 TCP retransmissions
  GRO corrected:     29.779541 Gb/s,   0 TCP retransmissions
  Original restored: 29.994158 Gb/s, 540 TCP retransmissions

Endpoint interface error/drop increments and receiver FQ drops were zero in
all three arms. The unchanged sender in this historical receiver-isolation
test was still on 7.0.2-6-pve with TX E2E enabled; receiver RX flags stayed
FRAME|E2E (6). Both hosts now remain on 7.0.14-28-pve. This is not a
two-latest-kernel GRO-only comparison.

Minimal reproduction outline: establish direct USB4 IP connectivity with the
above settings, run an iperf3 server bound to the receiver's USB4 address,
and run one 20-second TCP stream from the peer:
  receiver: iperf3 -s -B <receiver-USB4-IP>
  sender: iperf3 -c <receiver-USB4-IP> -B <sender-USB4-IP> -P 1 -t 20 -J
Repeat after changing only the receiver's header/headroom line, then restore
the original receiver module and repeat. Module reload interrupts the data
link; our management connection was separate.

Mechanism and minimal correction in tbnet_probe():
- dev->hard_header_len += sizeof(struct thunderbolt_ip_frame_header);
+ dev->needed_headroom = sizeof(struct thunderbolt_ip_frame_header);

The 12-byte transport header is not part of the Ethernet MAC header
presented to eth_type_trans()/GRO. The original hard_header_len is 26 rather
than ETH_HLEN (14), so gro_list_prepare() can compare 12 IP-header bytes as
link-layer bytes and fail to recognize packets belonging to the same flow.
Runtime tracing confirmed original hard_header_len/needed_headroom=26/0
versus corrected 14/12.

Historical paired receive hooks on 7.0.2 covered the same 18,871,120,863 TCP
payload bytes and 303,590 packets before GRO and at TCP ingress, on the same
CPU. Forward sequence gaps were 0 before GRO and 1,219 at TCP ingress, with
no packet-length parsing mismatches. A corrected capture had equal byte
coverage and zero forward gaps. Retransmitted/overlapping sequence ranges
were treated separately. This localizes the observed ordering defect to the
receive software path; it is not proof of physical USB4 packet loss.

Full reproduction details, source provenance and the one-line patch:
https://bugzilla.proxmox.com/show_bug.cgi?id=8306 

Independent hardware validation shared with the prior fix's author:
https://github.com/riverscn/thunderbolt-net-dkms/issues/27 

Separate context: with both hosts on 7.0.14-28-pve and GRO already
corrected, we also observed TX-credit-dependent fragment-validation errors.
A local negotiated TX E2E opt-in gave 18,604 -> 1 -> 18,601 TCP
retransmissions in off/on/off 20-second arms. This is a separate diagnostic
change, excluded from the GRO patch. Its lower-level cause is unresolved; we
are not proposing globally re-enabling TX E2E given the known controller
compatibility concerns. The related discussion and limitations are here:
https://github.com/hellas-ai/thunderbolt-ibverbs/pull/78#issuecomment-672616
9650 

We have not reproduced these observations on the latest vanilla mainline
kernel, and upstream acceptance of Shun Li's GRO correction has not been
verified. Could you assess whether the GRO correction is appropriate for
upstream/backporting, or point us to an existing fix or discussion? Raw
benchmark and trace evidence is retained locally.

AI assistance disclosure: source review, diagnostic automation, analysis and
preparation of this email were AI-assisted using OpenAI Codex (GPT-6 model
family; a more specific serving-model identifier was not provided).
Measurements came from actual hosts and are not simulated results.

Thank you,
Brian James

