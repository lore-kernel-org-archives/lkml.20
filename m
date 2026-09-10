Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FC835201F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033846; cv=none; b=ZL1UQj37WavMOPJU/rkvrYlYCA8Gxq5ULaUn6rFRCfj/SUndYF1M7iJTQBSRbTyjwBDTLJccyQQEGlj6+rwUlGt2VZC/ljC7wbhbiKkmen8qxafRt5Ue44J/So3Sec2XD+xTMN1svA7FRXYx6hovjuYOmb7dh+hAQstWxYwGpAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033846; c=relaxed/simple;
	bh=fADX6bakME15FcbDG5jjpLzyNHp0FH1yrxpHc1yZrPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fr5aBDB35f2OV/70Y6OmZtoiV0Sg5nDiwc+htsAiXc/Q3Gm/+JogWz1R37RYaBo9PHHEo0o4FG4B/Lw9zNpZA1E9FOAGmAHKAAo3zMgZbV+bbwiS8pevRdPOS3gSKL3g5QjtyKc9KPNWTq1qbqm2bfN5fkiSeKRIbXgAIJg9P1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lrmn4N9f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lrmn4N9f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39FE1F000FF;
	Thu, 10 Sep 2026 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789033844;
	bh=TETpEQSBazyu3WU9EzA6S7Fuo4OZmYrVUZduaHo9NxY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Lrmn4N9fA7xxEfXhhqevBTEJ6tLHSJw7+z3izH0+ZfTLJ5CtxSYdo5etGAxobiixj
	 klaXd6b4oSLXLSR090imvTEv8hLtMSu4P7rNx4ARrYjc4mEexM8pjh5PFaTNImudI+
	 uAe1CjkyK6jLBEQoQweXaJSFQM4oTwVpz1xXWCKD3Sp/4h0F67mV38XSekYJ0KOI50
	 Vn8cdvcfvAicDkkqCMHSvLtO2bGXU6LkT75N/+CiWrczrv3YX/cOUCziOcuyJl6ic3
	 VkpAwh7xlSp1vc7zOMKsSAUqisCi8tYmvrD7NuClS4w8Xw+95LgbJkRFhEB/Dyp2en
	 2mf2VHFOQZ8Hg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org, Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Paul Walmsley <pjw@kernel.org>, 
 Pratyush Yadav <pratyush@kernel.org>, linux-riscv@lists.infradead.org, 
 kexec@lists.infradead.org, Baoquan He <baoquan.he@linux.dev>, 
 Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20260905145835.501635-1-sourabhjain@linux.ibm.com>
References: <20260905145835.501635-1-sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v2] kexec_file: remove unused
 arch_kexec_locate_mem_hole hook
Message-Id: <178903383428.3691424.5770723322056518060.b4-ty@b4>
Date: Thu, 10 Sep 2026 12:50:34 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Sat, 05 Sep 2026 20:28:35 +0530, Sourabh Jain wrote:
> kexec_file: remove unused arch_kexec_locate_mem_hole hook

Applied to kexec-7.4 branch of liveupdate/linux.git tree, thanks!

[1/1] kexec_file: remove unused arch_kexec_locate_mem_hole hook
      commit: 06ce2863e7d28bcee539b90c87960edda742fe18

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: kexec-7.4

--
Sincerely yours,
Mike.


