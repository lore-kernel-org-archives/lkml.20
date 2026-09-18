Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7730B4BD370
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734506; cv=none; b=VuGIPqhxqN8oqDBRNzUEuKVW8AlAu4pf+2WdfHtxPmpn/NHiJDgh9k/GVUKxb3qcROECivOYwTjLGbhoUYz+3Ss33vMUDXTz9cy0AhQMnusw4PLXnQhpnbo5cdOirVBBwpfWJ+XcRJCKhEUfYkiRsmWD5wUA9vbkYhzMrNghLz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734506; c=relaxed/simple;
	bh=TuhrUaCZHe3buS1Z91faDV7r/isOQ93qEaUSQqtXd4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BSmuXN5N4Ij1M5mVv1uNJbQZXTXdPbQC+QlqYV//K4Bhvr3RFi23BpfksSll60Nx6/EKo93oSzsSG2xiN8eZZST+5ibhGh64Ua8csqTmdMDkiOSBvqrcsLBR7N5sKj+2A9HFdxazak5Yn2Wkbf6NwucBjOCdGdjTC2KEPS9VWLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EthI15cg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EthI15cg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94F41F0089B;
	Fri, 18 Sep 2026 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789734504;
	bh=U85I0+4wNOSGacaQS9fkT6Xhn7ekRJlDjzLJdB2UOOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EthI15cgtSIZ1jSy/TAl/GNPqI4psYUk9weO3zc8EdTH8cn/6LopsmWvoZq2Sietz
	 blOikGFtyxynFn0f4+4KCuFTdOeWYnuff0kKn5bUb/QsuZqdBXM80hHH+Ll8l3SADz
	 XI7HUGQO22IMSzbDktFr/F3nozN6zX4KRkUdz8WYEqL5tXqaUdEXOCerzJ7h/91bk+
	 KA1x1jiY81xTQiLZtBk5oEK6ZotNev9M9d7fJ4byCN4btdohVRn3L5vivZWbf952Qz
	 VwOySqqIbZ1NdR2TuA+nQeOQQR27D9LS3dwpSiFzQQCslVswQxy+9G5dOoOgoff9jp
	 IvZvMUFCU2gCw==
From: Will Deacon <will@kernel.org>
To: anshuman.khandual@arm.com,
	gshan@redhat.com,
	catalin.marinas@arm.com,
	suzuki.poulose@arm.com,
	Zeng Heng <zengheng@huaweicloud.com>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	zengheng4@huawei.com,
	linux-kernel@vger.kernel.org,
	wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: io: Reject non-user protection in ioremap_prot()
Date: Fri, 18 Sep 2026 13:28:08 +0100
Message-ID: <178972997621.2320119.5986862527529026747.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911015859.71164-1-zengheng@huaweicloud.com>
References: <20260911015859.71164-1-zengheng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 11 Sep 2026 09:58:59 +0800, Zeng Heng wrote:
> Mapping a stack-top page via /dev/mem with PROT_NONE and then
> reading that process's /proc/<pid>/cmdline triggers a spurious WARN
> in ioremap_prot() through generic_access_phys():
> 
>   WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
>   Call trace:
>     generic_access_phys+0x1c8/0x228 (P)
>     __access_remote_vm+0x2b4/0x398
>     access_remote_vm+0x14/0x30
>     get_mm_cmdline+0xf8/0x2a0
>     proc_pid_cmdline_read+0x68/0x120
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: io: Reject non-user protection in ioremap_prot()
      https://git.kernel.org/arm64/c/bb756b11ad63

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
