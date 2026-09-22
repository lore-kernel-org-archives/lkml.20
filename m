Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402AE53D0D8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078302; cv=none; b=ex2knqEkY/U+WV2/nymMfkLQ1hFUXz4VbyF4Vrj6hJBPGAipuU8j2v/UVzVsJ9g8Vm9wS5MQCmV9mslxwM3xzxU1PPsDwElGtfa6vYrs9HS/w3qKwhL44dvOF7u0nyWWeJBP14pJoQl/l2ERsFhBrM3p3C78fZBeKDtSjWdrBsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078302; c=relaxed/simple;
	bh=FGerOu871UowTMinAm5AOAJrAfO1moJ0hV615Xiafaw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dp3FXInNbTjG+NZX9WSb322A6nHqcpCZfKUaY+0mWm8pNtCInWFSkR3HgrbeKkuDFOtXK9EfKi6KW2gU6T9bxzxOlKI9chfSFsuNHvAgUE1/F0UFKg57Vly8HmvUQouolOOv1ruFMfuBnCOFvuziWechkMoP4MVVK2xN5Toj28M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWLB4cx/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWLB4cx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078299; x=1821614299;
  h=date:from:to:cc:subject:message-id;
  bh=FGerOu871UowTMinAm5AOAJrAfO1moJ0hV615Xiafaw=;
  b=CWLB4cx/MHhZSFJwWQ1XSeEnxU7VPXTqbTJ/3TjNqfE6IVl2Du3LWSxK
   EAXuEA/WUFflkloHgaSVoqSi/qo/zQz54yLUSRWIQIqRHTXTqqn08TCkU
   +XBVVyN5N2qww5qkEq0jR+HB21X85Ly+vaandfPI+mmIzGkgH/QBR1O/9
   7FzBNxVdVekHWffl5tkiiKDsxMN9O9ZSLE49/vnBHgl432L6Rz1q0Fe2g
   G15ADO6jR3cvqj3488LFYGDNRVKXySQ5q43lRGFsiX+RGJrQE7ggL2XyX
   VlJnRGNuSK3NRYqjS0BU33aPl3P6taBNIvt8LCIGJdhUAlhcaQVATmqzZ
   Q==;
X-CSE-ConnectionGUID: ZclNkNgQTQqVI6vty9GvMA==
X-CSE-MsgGUID: XMLQXwGXTv+5T6RYaGXz4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="102023556"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="102023556"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 04:58:19 -0700
X-CSE-ConnectionGUID: v1PI9L3ZSMO6GNssRlhFpw==
X-CSE-MsgGUID: a+SGeBbbT5yYSp/zFbVtLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="281165537"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Sep 2026 04:58:17 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8z8Y-00000000FS4-1Ujv;
	Tue, 22 Sep 2026 11:58:14 +0000
Date: Tue, 22 Sep 2026 19:57:21 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/bpf/fixups.c:1021:44: sparse: sparse: cast truncates
 bits from constant value (ffffc00000000000 becomes 0)
Message-ID: <202609221901.Su9mYT2B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Alexei,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 449f08fa59dda5da40317b6976604b877c4ecd63 bpf: Move fixup/post-processing logic from verifier.c into fixups.c
date:   5 months ago
config: arm64-randconfig-r1300-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221901.Su9mYT2B-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221901.Su9mYT2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 449f08fa59dd ("bpf: Move fixup/post-processing logic from verifier.c into fixups.c")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221901.Su9mYT2B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/fixups.c:2202:38: sparse: sparse: subtraction of functions? Share your drugs
>> kernel/bpf/fixups.c:1021:44: sparse: sparse: cast truncates bits from constant value (ffffc00000000000 becomes 0)

vim +1021 kernel/bpf/fixups.c

   975	
   976	int bpf_jit_subprogs(struct bpf_verifier_env *env)
   977	{
   978		struct bpf_prog *prog = env->prog, **func, *tmp;
   979		int i, j, subprog_start, subprog_end = 0, len, subprog;
   980		struct bpf_map *map_ptr;
   981		struct bpf_insn *insn;
   982		void *old_bpf_func;
   983		int err, num_exentries;
   984		int old_len, subprog_start_adjustment = 0;
   985	
   986		if (env->subprog_cnt <= 1)
   987			return 0;
   988	
   989		for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
   990			if (!bpf_pseudo_func(insn) && !bpf_pseudo_call(insn))
   991				continue;
   992	
   993			/* Upon error here we cannot fall back to interpreter but
   994			 * need a hard reject of the program. Thus -EFAULT is
   995			 * propagated in any case.
   996			 */
   997			subprog = bpf_find_subprog(env, i + insn->imm + 1);
   998			if (verifier_bug_if(subprog < 0, env, "No program to jit at insn %d",
   999					    i + insn->imm + 1))
  1000				return -EFAULT;
  1001			/* temporarily remember subprog id inside insn instead of
  1002			 * aux_data, since next loop will split up all insns into funcs
  1003			 */
  1004			insn->off = subprog;
  1005			/* remember original imm in case JIT fails and fallback
  1006			 * to interpreter will be needed
  1007			 */
  1008			env->insn_aux_data[i].call_imm = insn->imm;
  1009			/* point imm to __bpf_call_base+1 from JITs point of view */
  1010			insn->imm = 1;
  1011			if (bpf_pseudo_func(insn)) {
  1012	#if defined(MODULES_VADDR)
  1013				u64 addr = MODULES_VADDR;
  1014	#else
  1015				u64 addr = VMALLOC_START;
  1016	#endif
  1017				/* jit (e.g. x86_64) may emit fewer instructions
  1018				 * if it learns a u32 imm is the same as a u64 imm.
  1019				 * Set close enough to possible prog address.
  1020				 */
> 1021				insn[0].imm = (u32)addr;
  1022				insn[1].imm = addr >> 32;
  1023			}
  1024		}
  1025	
  1026		err = bpf_prog_alloc_jited_linfo(prog);
  1027		if (err)
  1028			goto out_undo_insn;
  1029	
  1030		err = -ENOMEM;
  1031		func = kzalloc_objs(prog, env->subprog_cnt);
  1032		if (!func)
  1033			goto out_undo_insn;
  1034	
  1035		for (i = 0; i < env->subprog_cnt; i++) {
  1036			subprog_start = subprog_end;
  1037			subprog_end = env->subprog_info[i + 1].start;
  1038	
  1039			len = subprog_end - subprog_start;
  1040			/* bpf_prog_run() doesn't call subprogs directly,
  1041			 * hence main prog stats include the runtime of subprogs.
  1042			 * subprogs don't have IDs and not reachable via prog_get_next_id
  1043			 * func[i]->stats will never be accessed and stays NULL
  1044			 */
  1045			func[i] = bpf_prog_alloc_no_stats(bpf_prog_size(len), GFP_USER);
  1046			if (!func[i])
  1047				goto out_free;
  1048			memcpy(func[i]->insnsi, &prog->insnsi[subprog_start],
  1049			       len * sizeof(struct bpf_insn));
  1050			func[i]->type = prog->type;
  1051			func[i]->len = len;
  1052			if (bpf_prog_calc_tag(func[i]))
  1053				goto out_free;
  1054			func[i]->is_func = 1;
  1055			func[i]->sleepable = prog->sleepable;
  1056			func[i]->aux->func_idx = i;
  1057			/* Below members will be freed only at prog->aux */
  1058			func[i]->aux->btf = prog->aux->btf;
  1059			func[i]->aux->subprog_start = subprog_start + subprog_start_adjustment;
  1060			func[i]->aux->func_info = prog->aux->func_info;
  1061			func[i]->aux->func_info_cnt = prog->aux->func_info_cnt;
  1062			func[i]->aux->poke_tab = prog->aux->poke_tab;
  1063			func[i]->aux->size_poke_tab = prog->aux->size_poke_tab;
  1064			func[i]->aux->main_prog_aux = prog->aux;
  1065	
  1066			for (j = 0; j < prog->aux->size_poke_tab; j++) {
  1067				struct bpf_jit_poke_descriptor *poke;
  1068	
  1069				poke = &prog->aux->poke_tab[j];
  1070				if (poke->insn_idx < subprog_end &&
  1071				    poke->insn_idx >= subprog_start)
  1072					poke->aux = func[i]->aux;
  1073			}
  1074	
  1075			func[i]->aux->name[0] = 'F';
  1076			func[i]->aux->stack_depth = env->subprog_info[i].stack_depth;
  1077			if (env->subprog_info[i].priv_stack_mode == PRIV_STACK_ADAPTIVE)
  1078				func[i]->aux->jits_use_priv_stack = true;
  1079	
  1080			func[i]->jit_requested = 1;
  1081			func[i]->blinding_requested = prog->blinding_requested;
  1082			func[i]->aux->kfunc_tab = prog->aux->kfunc_tab;
  1083			func[i]->aux->kfunc_btf_tab = prog->aux->kfunc_btf_tab;
  1084			func[i]->aux->linfo = prog->aux->linfo;
  1085			func[i]->aux->nr_linfo = prog->aux->nr_linfo;
  1086			func[i]->aux->jited_linfo = prog->aux->jited_linfo;
  1087			func[i]->aux->linfo_idx = env->subprog_info[i].linfo_idx;
  1088			func[i]->aux->arena = prog->aux->arena;
  1089			func[i]->aux->used_maps = env->used_maps;
  1090			func[i]->aux->used_map_cnt = env->used_map_cnt;
  1091			num_exentries = 0;
  1092			insn = func[i]->insnsi;
  1093			for (j = 0; j < func[i]->len; j++, insn++) {
  1094				if (BPF_CLASS(insn->code) == BPF_LDX &&
  1095				    (BPF_MODE(insn->code) == BPF_PROBE_MEM ||
  1096				     BPF_MODE(insn->code) == BPF_PROBE_MEM32 ||
  1097				     BPF_MODE(insn->code) == BPF_PROBE_MEM32SX ||
  1098				     BPF_MODE(insn->code) == BPF_PROBE_MEMSX))
  1099					num_exentries++;
  1100				if ((BPF_CLASS(insn->code) == BPF_STX ||
  1101				     BPF_CLASS(insn->code) == BPF_ST) &&
  1102				     BPF_MODE(insn->code) == BPF_PROBE_MEM32)
  1103					num_exentries++;
  1104				if (BPF_CLASS(insn->code) == BPF_STX &&
  1105				     BPF_MODE(insn->code) == BPF_PROBE_ATOMIC)
  1106					num_exentries++;
  1107			}
  1108			func[i]->aux->num_exentries = num_exentries;
  1109			func[i]->aux->tail_call_reachable = env->subprog_info[i].tail_call_reachable;
  1110			func[i]->aux->exception_cb = env->subprog_info[i].is_exception_cb;
  1111			func[i]->aux->changes_pkt_data = env->subprog_info[i].changes_pkt_data;
  1112			func[i]->aux->might_sleep = env->subprog_info[i].might_sleep;
  1113			if (!i)
  1114				func[i]->aux->exception_boundary = env->seen_exception;
  1115	
  1116			/*
  1117			 * To properly pass the absolute subprog start to jit
  1118			 * all instruction adjustments should be accumulated
  1119			 */
  1120			old_len = func[i]->len;
  1121			func[i] = bpf_int_jit_compile(func[i]);
  1122			subprog_start_adjustment += func[i]->len - old_len;
  1123	
  1124			if (!func[i]->jited) {
  1125				err = -ENOTSUPP;
  1126				goto out_free;
  1127			}
  1128			cond_resched();
  1129		}
  1130	
  1131		/* at this point all bpf functions were successfully JITed
  1132		 * now populate all bpf_calls with correct addresses and
  1133		 * run last pass of JIT
  1134		 */
  1135		for (i = 0; i < env->subprog_cnt; i++) {
  1136			insn = func[i]->insnsi;
  1137			for (j = 0; j < func[i]->len; j++, insn++) {
  1138				if (bpf_pseudo_func(insn)) {
  1139					subprog = insn->off;
  1140					insn[0].imm = (u32)(long)func[subprog]->bpf_func;
  1141					insn[1].imm = ((u64)(long)func[subprog]->bpf_func) >> 32;
  1142					continue;
  1143				}
  1144				if (!bpf_pseudo_call(insn))
  1145					continue;
  1146				subprog = insn->off;
  1147				insn->imm = BPF_CALL_IMM(func[subprog]->bpf_func);
  1148			}
  1149	
  1150			/* we use the aux data to keep a list of the start addresses
  1151			 * of the JITed images for each function in the program
  1152			 *
  1153			 * for some architectures, such as powerpc64, the imm field
  1154			 * might not be large enough to hold the offset of the start
  1155			 * address of the callee's JITed image from __bpf_call_base
  1156			 *
  1157			 * in such cases, we can lookup the start address of a callee
  1158			 * by using its subprog id, available from the off field of
  1159			 * the call instruction, as an index for this list
  1160			 */
  1161			func[i]->aux->func = func;
  1162			func[i]->aux->func_cnt = env->subprog_cnt - env->hidden_subprog_cnt;
  1163			func[i]->aux->real_func_cnt = env->subprog_cnt;
  1164		}
  1165		for (i = 0; i < env->subprog_cnt; i++) {
  1166			old_bpf_func = func[i]->bpf_func;
  1167			tmp = bpf_int_jit_compile(func[i]);
  1168			if (tmp != func[i] || func[i]->bpf_func != old_bpf_func) {
  1169				verbose(env, "JIT doesn't support bpf-to-bpf calls\n");
  1170				err = -ENOTSUPP;
  1171				goto out_free;
  1172			}
  1173			cond_resched();
  1174		}
  1175	
  1176		/*
  1177		 * Cleanup func[i]->aux fields which aren't required
  1178		 * or can become invalid in future
  1179		 */
  1180		for (i = 0; i < env->subprog_cnt; i++) {
  1181			func[i]->aux->used_maps = NULL;
  1182			func[i]->aux->used_map_cnt = 0;
  1183		}
  1184	
  1185		/* finally lock prog and jit images for all functions and
  1186		 * populate kallsysm. Begin at the first subprogram, since
  1187		 * bpf_prog_load will add the kallsyms for the main program.
  1188		 */
  1189		for (i = 1; i < env->subprog_cnt; i++) {
  1190			err = bpf_prog_lock_ro(func[i]);
  1191			if (err)
  1192				goto out_free;
  1193		}
  1194	
  1195		for (i = 1; i < env->subprog_cnt; i++)
  1196			bpf_prog_kallsyms_add(func[i]);
  1197	
  1198		/* Last step: make now unused interpreter insns from main
  1199		 * prog consistent for later dump requests, so they can
  1200		 * later look the same as if they were interpreted only.
  1201		 */
  1202		for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
  1203			if (bpf_pseudo_func(insn)) {
  1204				insn[0].imm = env->insn_aux_data[i].call_imm;
  1205				insn[1].imm = insn->off;
  1206				insn->off = 0;
  1207				continue;
  1208			}
  1209			if (!bpf_pseudo_call(insn))
  1210				continue;
  1211			insn->off = env->insn_aux_data[i].call_imm;
  1212			subprog = bpf_find_subprog(env, i + insn->off + 1);
  1213			insn->imm = subprog;
  1214		}
  1215	
  1216		prog->jited = 1;
  1217		prog->bpf_func = func[0]->bpf_func;
  1218		prog->jited_len = func[0]->jited_len;
  1219		prog->aux->extable = func[0]->aux->extable;
  1220		prog->aux->num_exentries = func[0]->aux->num_exentries;
  1221		prog->aux->func = func;
  1222		prog->aux->func_cnt = env->subprog_cnt - env->hidden_subprog_cnt;
  1223		prog->aux->real_func_cnt = env->subprog_cnt;
  1224		prog->aux->bpf_exception_cb = (void *)func[env->exception_callback_subprog]->bpf_func;
  1225		prog->aux->exception_boundary = func[0]->aux->exception_boundary;
  1226		bpf_prog_jit_attempt_done(prog);
  1227		return 0;
  1228	out_free:
  1229		/* We failed JIT'ing, so at this point we need to unregister poke
  1230		 * descriptors from subprogs, so that kernel is not attempting to
  1231		 * patch it anymore as we're freeing the subprog JIT memory.
  1232		 */
  1233		for (i = 0; i < prog->aux->size_poke_tab; i++) {
  1234			map_ptr = prog->aux->poke_tab[i].tail_call.map;
  1235			map_ptr->ops->map_poke_untrack(map_ptr, prog->aux);
  1236		}
  1237		/* At this point we're guaranteed that poke descriptors are not
  1238		 * live anymore. We can just unlink its descriptor table as it's
  1239		 * released with the main prog.
  1240		 */
  1241		for (i = 0; i < env->subprog_cnt; i++) {
  1242			if (!func[i])
  1243				continue;
  1244			func[i]->aux->poke_tab = NULL;
  1245			bpf_jit_free(func[i]);
  1246		}
  1247		kfree(func);
  1248	out_undo_insn:
  1249		/* cleanup main prog to be interpreted */
  1250		prog->jit_requested = 0;
  1251		prog->blinding_requested = 0;
  1252		for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
  1253			if (!bpf_pseudo_call(insn))
  1254				continue;
  1255			insn->off = 0;
  1256			insn->imm = env->insn_aux_data[i].call_imm;
  1257		}
  1258		bpf_prog_jit_attempt_done(prog);
  1259		return err;
  1260	}
  1261	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
