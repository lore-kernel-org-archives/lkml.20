Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775984;
	b=4ezWrF/rN5VTenEj7KQt7vWZB0dCTG5hZQs0oXSoRoxasxUUjbBp3KfX4Hi4N9itRPDE
	 DP2gNjyDLjNKh9z12gLR7W7InIriOd4dwbTY9A9hXfE8k7J/OVikZiQpKq5qjZO9fFE0B
	 5UIQJ2WwvOAqM7mD2Uo3jGalEoX5nYp4jDArbqVR2H7l9M4aWDriIAOFtwbnvQyJ+ovf7
	 FUam7IJVZ1RElUkH3i7sUgKjGT8cILgGiQj3U/hNhCsG0AD/5AR/O6VSXCtZAemzdbrVv
	 eUU9uS5UcSBLhoD5H9K435JwejP69qy1ay88m7Q347Q0oFr1z2XFuBt6MjjEp6wntow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775984;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=eKDTH0MLAoeCDhgOJZ28iGDUuVKoiijcjuCI9gWAGe0=;
	b=aOrrazqrYj0oo8X/Ym9IM0ApMjkR0dtpqCTW8gx+3rlVkTYkgCFK4DnhY0pudl8GdK/i
	 uGRzJAEFwZXqmSoUwtIsQAfyR7SNrPepsYYzlouwe/lq80QOV5iPld6B0d59vjbuDjtMp
	 U5zj8buB7UGTKkMsK5J6voKR6z1IGlAz9W4Jn/hRVpSOf4Gk5b+3CuqeBfJhGllvs3J4i
	 +0PcYFQA2ss0SnGCqaHd5p7AqVHjgiAP7Ot1ZUHRSs+d0QL6eEqZG+rdjvSP2gaSB+jB3
	 NuugPfcnm7CY8D7R9ROxs4ExaWVN5Y/zFoQb4XQCYILVLNhtFE+SiBRL24LV2d5fAIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lxzl54JO;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF89606A338
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF89606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lxzl54JO
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BACA1C00;
	Fri, 23 Oct 2026 10:19:39 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 097FF3F7B4;
	Fri, 23 Oct 2026 10:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792775982; bh=22SUcq5bb2KGp5212Gb23QIKYxy3lJocLmhA7Vz4YU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lxzl54JOfCUeLDlgUrsc47Tw4QUN7hMZy2I8f+1qUnV0rI4NEzd1bRqWkWNCPdq1X
	 8nJHem1U6E3jLfjD8TiWIvSfu7KlDrJnJmv+ES6LhfQUb657RHHd9/DXa0SRMeXo97
	 M+nJx6UTYvMxz8RtVghryfbLDZhbIvLQamX8gTeY=
From: Catalin Marinas <catalin.marinas@arm.com>
To: james.morse@arm.com,
	ben.horgan@arm.com,
	Ping Li <leeonion.muyu@gmail.com>
Cc: Will Deacon <will@kernel.org>,
	andre.przywara@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: Release the mon_sel lock on mpam_save_mbwu_state() errors
Date: Fri, 23 Oct 2026 18:19:31 +0100
Message-ID: <179277597074.484399.16115818154176601359.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020114807.3915705-1-leeonion.muyu@gmail.com>
References: <20261020114807.3915705-1-leeonion.muyu@gmail.com>
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
Content-Transfer-Encoding: 8bit

On Tue, 20 Oct 2026 19:48:07 +0800, Ping Li wrote:
> mpam_save_mbwu_state() takes the mon_sel lock at the top of each loop
> iteration, but the four error paths that return after failed
> MPAMF_MON_SEL register accesses do so without releasing it.
> 
> Take the lock with the conditional mon_sel_lock guard class instead,
> so all exit paths release it.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm_mpam: Release the mon_sel lock on mpam_save_mbwu_state() errors
      https://git.kernel.org/arm64/c/643b64025650
