Received: from mail-qv2-f7.google.com (mail-qv2-f7.google.com [74.125.230.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C023A274658
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436975; cv=pass; b=FSUv/IUaoMroWIJ0t8y5TTqVzQyQMSq+294U4IDdtQYSy++POuMItZ091HLJUKhlRoOXRqb5yaNmusjNig2OUY4ytUCsedmhm56C94tLDbs+iRf5XH5heT9Fv36qxV+FJrFLtdzs2IFoNRYcaNX+eNMf7gjwMsICJJ7WyAN15N4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436975; c=relaxed/simple;
	bh=x+FU4SJGWsh1vn4yEtFsZ3aA/vqNWVzllOdxlwhOH+g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FE0cJVcyXJ0FlqX0Pv1P2RBq38C3JWM+MPt3puRfuNEIYhrfwL8kgf5Usl6QAQcvkRVS57YmI0FJOiOyoy+NSuP6pWE4YxtbmK0EhzxSRQSlqTX6T/AP87nx1Kr+PsR/jem0NRW5LuFHAOhRRU+k62Dmisfl1ILGPv+h2lqTx/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAg2TMW+; arc=pass smtp.client-ip=74.125.230.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAg2TMW+"
Received: by mail-qv2-f7.google.com with SMTP id 6a1803df08f44-90ccffc2654so27948046d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789436973; cv=none;
        d=google.com; s=arc-20260327;
        b=UXsIrVejtxDQ/XkUkvygCySTSZD3xEIBSiYs57EkP0rw45VkzJ8KvVcvh+nw2je4r5
         0sqFN3FJvR9KAUtsb0Ae6/smTNuwN/VwlaVgNvCVPR4bAAOevaAOjELQ5dDlHcBTjsDF
         OHQb2LNAcqlTCe2ptQ95g79NWyQ/LeHBEQl4O07itjRCmt2wWrNxzPHagXo/05USr+Vn
         JWNaBlIHDV5y5iq4kD7DwIt+moGYKvMtVT9td3rzsOSPHPdCDTN2/zwjuWNCJ9+fir3L
         j/DN/ANlP/gXRd339ERwRIyzXf0O8Yyn4dKKdS3tvwArJ7MRzERPesqbvUGlInX9JsIU
         90cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9cCP8ATHiCM3DZdDsKWL2HHlyC1tigS+r4nKWX9jez8=;
        fh=fxKxc6WRQiHtzgxl4x97gqm1TmTidNWITgmBuylCihc=;
        b=OL0jv1oAqotDgMEXcJCk/DHS9ZqGNpEusJKwM0lOGQnycR0dVl+72nTuTzHctp/8uu
         cwGReb8ptI6XBZXyKSDGOazIz1Q1GwmCfitK0Kg3aOobKw0ajh9PyfOMVwHkhFWalWhT
         fpzFc1USgpkJMPnLTQVSIwVxlyh9iWJGIH2dxUNkfhPUvr9eXoJDOkL7fTMwjJNqmOVt
         gN+uv8HwYnNJeE+iYP4Gbul43i6siHbIsprTLFllwKFMwyc6Bfpjvuu44hyddHqpQgqt
         67/81EexJM49SgrQnoDywLRf13npuWkicfPEn5tifuCWnkY/OwyWkFDEu7vLqbdT2fl/
         ZCdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789436973; x=1790041773; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cCP8ATHiCM3DZdDsKWL2HHlyC1tigS+r4nKWX9jez8=;
        b=TAg2TMW+wbe2sTCMS3MFGzksHQzW3ImrCNe5rKLq3ZqgVW8MrK/p4Tqth9S/57HYlw
         fcOLlp8eP0lgfH7AhrE020R95TaQc4MxKU9GwhAsaSiP7eyKEioy8ZpfxFcgZSPwNMip
         0UsDw3Qkrl6xXBOu0l5RAOFf9wGHekCWbAQ6AMxP1oyTn+E4/xKF72LKPtMswNGVHvrl
         DALEE2iYK2c9ReJ0NvOYBwkkYrhO42JLlyAl4JMBuDmsrSBmggaS7vIUNKAfHHpf4+la
         AY/c4Lf+b7iSt+JjVDftCbxWuWW2MJ7g9xRenmUJBhjRkilK3NVNV4SxcZFULlnhyiHA
         WckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436973; x=1790041773;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9cCP8ATHiCM3DZdDsKWL2HHlyC1tigS+r4nKWX9jez8=;
        b=dykd+LxZy8LuDevwBD8ZFvqcD+d6rYU9dkMXXashjMVYd2j5EDSV/gflKgGDAcd361
         +de5iU1JIhGH49v5bI5mqoERyVFv+m1XalQxmEHdIUf6HdK/33hEd4YQYWbcjlrXjCLU
         rijZPB5UIby3V6aR/aoeLDfmrs0c6IgEttrJ4Ms7d0ds4lVHu6d9+lN23UZknDYv0xdg
         z7KHSfd96sjbEEUIPME/IUQPwCkonZkGjV7gcY85sTrr8FILM6rpVJi6eDUK52hJeYGn
         bQyz7gCtO5S/7vsEPUz/2flR2eTKPdLsxnxdRKDMc7JlknsD67t0rOGXkEjgUN0Jp4zU
         rBKg==
X-Forwarded-Encrypted: i=1; AKwUvBxrQfHEEB7F+fzMkJ3CyZhKb5uhjnCXdgWzyr2MGUPQj/03ZbOz5O0IWcbZ0xdPsZls6XPOb6CB4Suw0Eo=@vger.kernel.org
X-Gm-Message-State: AFuF++kxm8a8UwSZvgriCHajWpijJoy+cosOVvWzGGJZIk8iFKUTY4Ph
	hVgk792pCByN6BzfbvR57PvcQ3atgS2rS6kb0QOBwonTJZ6oEbCWLSr1I2Oj39XT1rmTvGea8eU
	RwMAkQizSdKu51kx4jfOxtb2jo01+L/n0rhAzoF6AwrDcV61c1Q==
X-Gm-Gg: AYBFou3bk4P10MUImLbvVnOAUfGTDaGWG0/w9ltRrSqthgrpp7G8thOaPONdD+k9BJB
	0r3gzRWXdRdTKMLxpuBc4t3FX6bR2dEAqZ8vaioTjN6/yeHK3c4isnzC4JzUnJiFok5yJ92sFeM
	1cG8nqw3QNCezQpuUqGIm8/O8sWPzB3jxPU3lZfpwq1khDIBZViD/ARpg/Rj7bC2N3MEDSB3v5D
	E0bY6x9SuOuoQEkOfP7YBaVE/ucHzIZeAKBO6fVBGY20HIWvldjKSl1oa3n3j+K9ZOG5sbggqqx
	sauBUPRfRSopmV/2cPJcntYBiaqSOQs9URxnm1A+PIH4zK0x9fVkPB8=
X-Received: by 2002:a05:6214:2345:b0:910:3453:d4a7 with SMTP id
 6a1803df08f44-9122e65c134mr82476666d6.33.1789436972473; Mon, 14 Sep 2026
 18:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: jiabin deng <dengjiabin2023@gmail.com>
Date: Tue, 15 Sep 2026 09:49:19 +0800
X-Gm-Features: AcwNN1Wkb8iqVJYJHNixGe8po7o_nQWtmkOuwwuyqzt-GedXISps1PZMfaegazE
Message-ID: <CAFxp=AY2cVRQrZvB9WNnigbsobuw11NMG-cagHx0_V+ur2ToFw@mail.gmail.com>
Subject: mlx5e:zero-prefix corruption during TCP DMA-BUF RX - help requested
To: netdev@vger.kernel.org
Cc: saeedm@nvidia.com, tariqt@nvidia.com, mbloch@nvidia.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello mlx5e and networking maintainers,

We are investigating reproducible data corruption: with SHAMPO enabled,
some TCP data is corrupted when received through mlx5e directly into
CUDA-exported GPU DMA-BUF memory.

The full expected number of bytes is received, but the prefixes of some
payloads become zero. The corrupted ranges end exactly at the next
64-byte boundary in GPU memory.

We have not determined whether this is a driver bug, a configuration
issue, or incorrect API usage in the reproducer. We would appreciate
your guidance in narrowing down the cause.

Receiver environment:

- OS: Ubuntu 26.04 LTS
- Kernel: 7.0.0-30-generic
- /proc/version_signature:
  Ubuntu 7.0.0-30.30-generic 7.0.12
- NIC: NVIDIA BlueField-3 B3210E E-Series DPU
- NIC driver: Ubuntu-packaged mlx5_core
- NIC firmware: 32.43.2400 (MT_0000001117)
- GPU: NVIDIA H20
- NVIDIA GPU driver: 595.71.05
- Receiver uses the CUDA Driver API, built with CUDA 12.4 headers
- Architecture: x86_64, 4 KiB base pages
- Link: 100 GbE, MTU 1500
- Receive configuration: tcp-data-split on, rx-gro-hw on

Tracing confirms that the receive path executes
mlx5e_handle_rx_cqe_mpwrq_shampo().

The sender is a standalone Python TCP program that sends reproducible
nonzero data from host memory. The receiver is a standalone C++ program
using Linux device-memory TCP interfaces and the CUDA Driver API.

Test procedure:

1. Allocate 4 GiB of GPU memory, export it as a DMA-BUF, and bind it
   to RX queues 8-15. Direct all test traffic to RX queue 8.

2. Before each iteration, fill the GPU memory with a nonzero value
   and call cuCtxSynchronize(). Then transmit the test data, in which
   every byte is in the range 1-255.

3. Receive the complete message using MSG_SOCK_DEVMEM and confirm EOF.
   Record the returned DMA-BUF offsets, lengths and tokens.

4. Keep all receive tokens outstanding. First read the data back with
   cuMemcpyDtoH(), then call cuFlushGPUDirectRDMAWrites() with
   CURRENT_CTX and TO_ALL_DEVICES, and read the data back again.
   These two reads produce the snapshots before and after the flush.

5. Compare the two snapshots with each other and the first snapshot
   against the expected data. Return the tokens through
   SO_DEVMEM_DONTNEED only after both snapshots have been saved and
   the comparisons have completed.

Each iteration uses a new TCP connection. Test connections do not run
concurrently.

Observed results:

We tested eight message sizes from 32 KiB to 4 MiB, with 50 iterations
per size:

- 400 iterations completed.
- 354 iterations contained at least one corrupted range.
- 20,707 corrupted ranges were recorded.
- All recorded corrupted ranges were zero-filled prefixes ending
  at the next 64-byte boundary in GPU memory.
- Corruption was present in both snapshots, before and after the
  explicit GPUDirect write flush.

A specific example:

- Packet payload length: 1448 bytes.
- Offset of the first payload byte from the start of the GPU buffer:
  2149169912 bytes.
- This byte offset modulo 64 bytes is 56 bytes.
- First 8 bytes: zero.
- Remaining 1440 bytes: correct.

Related source observations:

The receiver's drivers/net/ethernet/mellanox/mlx5/ directory and headers
under include/linux/mlx5/ are byte-for-byte identical to upstream
v7.0.12. The running kernel is an Ubuntu kernel; we have not yet run
this test on a current vanilla mainline kernel.

One possible lead is an interaction between SHAMPO end padding and
Relaxed Ordering writes. In this version, rq_end_pad_mode() disables
end padding only when LRO is enabled and write RO is supported.
SHAMPO therefore selects ALIGN; at the same time, write RO is enabled
on the payload MKey when the device advertises write RO support.

Commit e2351e517068 ("net/mlx5e: RX, Avoid possible data corruption
when relaxed ordering and LRO combined") describes a related issue
with consecutively placed LRO payloads. We would like to understand
whether SHAMPO might also need to account for a similar situation.
We do not yet have results from padding/RO diagnostic experiments.

Is our receive and synchronization sequence appropriate? Are there
known issues or fixes relevant to this configuration? Please also
advise which additional logs or targeted tests would be most useful
in identifying the cause.

Thank you for your time,
Jiabin Deng
