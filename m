Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FC23B27CF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291503; cv=fail; b=GFSLcI/+j65Ytx+R4FmcKHhcpoNJuIL0zz7IXNtH0sNmRbRfoFIHMdCRWKW1/z2J88RSENKMoMkZtuuf1NMB/eyenmMSiBHWwiOGXLjXzhvYHThL6eqtZN40MXmcoeW0fiBDr0VR7Y5ebHQpZEPHo1CY976ybgDTsQoingn5sX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291503; c=relaxed/simple;
	bh=rzc6jUVgcQIY1Ogb4iLMEwM5JZlF7sPt09+auENwZWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oEpPQDIxBi21dJNCq2SWg9uPAfmHcfuY1iR/a/an2YcWuHWmRiZmr5QZFStKvsXwYdWAGeNAtvwAR0CkbtYOXPY1s3N7ueJS9wB+o6pamTND9Sgt/3H51F1iAei4oF69puYJHlw7Qlpxa73BxPFG9k/ybdzSDOunIaclu9Q+PAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h/LcqjDF; arc=fail smtp.client-ip=52.101.61.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h/LcqjDF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdlMCq33PkgtjqcZHaehkLESz3jIfwksZa+amzN39SXASuBX1stZcKArur9FTOA6iJugZeH2U7zKkKsmopULNBfEuKAbHLx380PpwSCbEqObqEV98QJmkFfhVrwPED01I+lgxUMytSv771G3yABgr0ekLyAsJfhNZg4sQTH8KvNnaHTTnLZejq4TiZvRlDllPeJ4kn8LrWUfTsSfMfte3SNEBzVuoyMocsH8PPuii9haQAdBrqvKwnk4QDbFhG3fmAYp6oHpWSO9rmw51j1Wu0gyII0pM5lS786q0gF4p5bg4vc+qvS879B5SeCnMeHKGZQQXIgyYqfw550EeHN8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6y1Fud7IWTKJABngp1BcnESrVoszryA38tIGmaHdhz4=;
 b=dp8pG4PHv8Q899R9QppLV7ru2bgvuGMyOwZuQY769zT7OOuk6EPmvYeJtxvNG0cX6b4L8+NyOLzJY3Tr2XDMptp1dyl6OpbJGqU2RZq+6kV6CkFYAA7rxDiPmPsjuvzCe2Ui905Gi0uLiSwLrqFHT9ICxh75bQ4fhuaYZZEcj0iac8MDtGSKvV1rcqFuwoJuhPNe5DDj/7n1m6LNwIbWvSYBTQqHXvQ7oplG77zsduz1F5PfvGAZJ2+dJPkrwnq63bAXl4aRXdsNOn/tJ6gvny9EhM/M8IAH39Sl6li29waTxxMOG/1gNQ88/1vZt18YVBgmztOy8tNf91ye8PT4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6y1Fud7IWTKJABngp1BcnESrVoszryA38tIGmaHdhz4=;
 b=h/LcqjDFias2OeHjqK5I+SMekpZTzoJV/t3M4W5n0ABCUjnW71maGL687Fpk8jVOjTt6PAe0VH9bJv9JoYsbIDnaLIIqbsIuc/fIYJyJkgSaInmBejBPhdp8BgQ0flS8paKDlv0SRiLfqABKA9rvUT/ZWtsNW9D2pV6ycd+fFGfRIkQ/Jbg8g827vDWrG247LbRrFabufy1tqgYbvbIoT7JjTlQD3XaR4Bc9b7F08KgLTLM59I7UmRny7bJyuzKia28SBK3ob9xz2/zoW/3Bl5c/18AC1ClnOQe5MmXzz4MtxveSnjgrl4RNaqO8lyGdCq8ThMvbkx1uv/e3FIScIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by DS0PR12MB7972.namprd12.prod.outlook.com (2603:10b6:8:14f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 19:38:15 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 19:38:14 +0000
Date: Tue, 1 Sep 2026 21:38:05 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
Message-ID: <apcpnYdW6vzew36c@gpd4>
References: <20260831181800.1668646-1-arighi@nvidia.com>
 <20260831181800.1668646-2-arighi@nvidia.com>
 <f5d625d0-3b94-407c-8f64-793df9590f03@arm.com>
 <apX1j6srdTcFLZOd@gpd4>
 <25dbcc86-bfb2-4018-b388-7d8d1693203b@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25dbcc86-bfb2-4018-b388-7d8d1693203b@arm.com>
X-ClientProxiedBy: MI2P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::11) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|DS0PR12MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: a920a16c-b566-465d-e167-08df08609072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Wg5WvASKaNOVNbD+7c4JvMCF9p2IO00DrUIkyB/XydH/7mLKJ44DEfS0BR9p+eLI9JrhX+Hi4LJ3ko49lxb/CSh/n8shfHwWDOzg6Ac+2QNBdsYLPv3oS9nZRIT/dZOkhhcqEvTHaC65C/CczBYkNLq/YP5/02wIjuKuWTLmY2wB7DpD0hE3CH0gpWIsJVQtWj2XkjHPR70wmjYJYQvpA0XSu7QDKCQa5jgVX4Wx4ee0lzUDQNxE2Rcv0nTjiwbmLFV9b6DdbeRcHGApJY71ivxAr0yKZv0JP2Zo7cegIPky8LyPXuh7hW6DIN/oEPAHMz4zFNj3UgE1bYPYFH+0hFq0GH7o9VTOjgrXAgruaBR77Iq66jam1b+eFVuCsDHsBZpzo+6pncvWEfn/8UyTSWR55s+sGtDQF3TmMUikliRda4Ya1LZS9wL78BE+jUH7hqBwrIyloeTM1xOtJGYasx6WQ8zU2EAis8Xm8j+zI8cR4e6siil8UZDpAkEdk8g8HftXCQkk3Hm8EU1JVy4+QsU5mR1q1PCfBzo6MkdS99handJai51uE4WyUK2T7Nw5Nn9Ay5fK102oOLGzPeGPN4C+dmi1/BIsaCtrXWebnbJDAlVzkJFr6QybvUw14xPoBSwuAqjrnCdsKTjauPZ7/iclMpdCEMy2Xi3NYrkpypQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mULytH9NKIHWYFymWpXgIAsW1zjY7BhvIyO6CoAfwlfk4YHyWMUulPttb0AR?=
 =?us-ascii?Q?zrtS5JqDQ8T21BdS29yqueNKvV/AF3WhRjMtS/1PAd0/FsTeFUAa8hT+9ayi?=
 =?us-ascii?Q?59ou6y7SfX55VD3ODIT/tDwGlwCqJVTMwWOHzk+trGp6M6ztMFuAs4I4chQ2?=
 =?us-ascii?Q?VL4F5+8q+53+CBry3qAQMiwgKmj7IrRwBLbzmHasiHObdmyOQex+DjAByZFP?=
 =?us-ascii?Q?bE/W75slDMHWSY9J+5SFOM0H4E9zsJ2cLEd1ID1Cun2GdbNtG2iHPryVdwFM?=
 =?us-ascii?Q?VmR0mNPqZ8ShSWpkW4iHVsLraYXTARpXSygbYWoJXnRTPUP4QrJ3eXBoM6q1?=
 =?us-ascii?Q?5UbZsrLxtHxe9jQy8NHnu7NB3fbjE3UuGS1JjZXOzwkPZz/Kom3h8d+ow8HN?=
 =?us-ascii?Q?0k6tVdiLKDbK7Z01SmWnAfnypzlXxp34yMIXT0swDV2XOOrfxqeU1e3oRkCb?=
 =?us-ascii?Q?64d8SzgAA5j3oi5s90LpgoQ4sAM5n5d54DxaxGlMIMrJ2ZrLWOM0SgDt8YZk?=
 =?us-ascii?Q?0JlujYsAPA6fAVIKltVkBscQYVHljCTPq9fe2gVqxTFCRI6rIN4Oxc4arOtX?=
 =?us-ascii?Q?6xRQeVszhoTfLUzJ4WC+w0IVm0nTszh168KBQbfa0WtxWcfL7WBFGdV37KNV?=
 =?us-ascii?Q?xN8Q62JPRM3ow00k+rjUFwTr2vyheDYKGuRvpyURH4VdI8NpNyEsZyPlKRrx?=
 =?us-ascii?Q?uQLxldhjD4qZ1RObfTvKlPz9G706Ra9QWDyd6Yzmx4t4DcOV5tZFgmHwZF8O?=
 =?us-ascii?Q?cPCA+vNxuS6jJQxilAFjXsRbt3Am29xC9PM/8FnE+Qd5IEyXiMQSqjuPNBcS?=
 =?us-ascii?Q?YVyDpaIMQRk/P/R4Z+vTk9RrLfhv4YcxUT55KRIuqo8iuCNx+rDkEFLQOmWq?=
 =?us-ascii?Q?hvBOi2Zd2D5Q1eWa+BaIHeD7P4UrO/K9XFeBGvsUZ4Gw8zZmGNp5UeHkgf5o?=
 =?us-ascii?Q?K74HxjEx1dppUOiFiCuTpf9xg+Ml9bW9gGRXTxqcCJDtGeowP6M+ahiwwLNN?=
 =?us-ascii?Q?wDamcHnef9ItdGDhhL4nZDuTKw/rNcddOI3B/UbUACsF4BelND6b75iivukt?=
 =?us-ascii?Q?QddYh58fH/590RaXXEV22ilBjc3ANFcdi5A2PDx9IjrY2dBP2/jweIiwCCSE?=
 =?us-ascii?Q?O1OFThhLsjMxO5h0Qd2iIgycm+/w20RAsRba0nkcU4j9lJT9FEHX3bqyqDQ6?=
 =?us-ascii?Q?dA2xgheCchx4DFgduX0zIzql6vM63xudtMNq+1nyUbk6kGQT9Zn49TaLKHdd?=
 =?us-ascii?Q?7XQTDscU7wNwQJkq6/HZGWhNAMtKGgvJuNTJq9495MUjj2C2ApGX+nYFGM/e?=
 =?us-ascii?Q?Y7+uriZckks677iMgDq0pW6/yOWZmZqZFsAz2p2qJeuLU/+GL8f6zS7QERc1?=
 =?us-ascii?Q?lCE8P7r9MuP+JA9NNZkoYcrdiP+6BL7Voj0Q5sIwQxgJI2H2eQiQHi5g+6eq?=
 =?us-ascii?Q?yGa1rTu8g+TI7OAbLZz3mgxChPSJgPNlqVUfRrQRt6hoNubwCn1NN9+p6AUD?=
 =?us-ascii?Q?PQ3GWhQlDsMzLnqhte3Zdf62XKbcpdUlunZaHneoGFQVC88AiPg5bpSaKnrc?=
 =?us-ascii?Q?oKQ13xlBPd3p+0WoePcOUJHeZRUCcrMWO6+or8/p5JF+TEZM7PGo0Qhv8nFX?=
 =?us-ascii?Q?0KIN3EZClUVczOyYu83GJ1yJXgaONggByG/K3SYGhCdwEvbeKnrTYgZMxfn3?=
 =?us-ascii?Q?BNPNyVtLyHuvRU5SV27CNUMjrBOL+3V0X5awiYuZ4RNCjzbuTUQJ0ucw32GJ?=
 =?us-ascii?Q?ka9BUaskGA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a920a16c-b566-465d-e167-08df08609072
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 19:38:14.8175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zrccl3RhJ0m0H+RAGeQyKbV3D1TK6c7RgYPkVYFQn7KJU5UQqZJfiOMdAW6hqzMnVmZgRvbBX/msNu18676TVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7972

Hi Christian,

On Tue, Sep 01, 2026 at 09:32:56AM +0100, Christian Loehle wrote:
> On 8/31/26 22:43, Andrea Righi wrote:
...
> > I can experiment with this combined priority, but I think removing
> > SD_ASYM_CPUCAPACITY is a separate policy change rather than an alternative
> > implementation of this fix.
> 
> Cool thanks, and sorry for curveballing the approach like this, I wish I had
> the platform to test these ideas myself :/ 

No problem, thanks for looking into this! Access to Vera systems is problematic
also on my side, especially for all the time it takes to run all these tests. :)

> 
> > 
> > A static asym-packing priority does not preserve the capacity-aware semantics
> > used for task fitting, uclamp, misfit handling and migration. The current
> > approach keeps those semantics when selecting a physical core, then applies the
> > PE preference only within that core.
> 
> Right, but arguably most of these semantics become questionable as soon as the
> core enters two-thread mode, since the capacity available to each PE then
> depends on the state of its sibling.

Yes, I agree with that the current capacity model doesn't account the capacity
lost when an SMT sibling becomes active. And Olympus makes that limitation
particularly visible.

That said, I think the static CPU capacity is still meaningful when there's no
SMT contention. SD_ASYM_CPUCAPACITY can compare the task's demand against the
standalone capacity of the candidate physical cores and select an appropriate
one. And looking at the results, this appears to be beneficial. Then the
SMT-local asym-packing priority can select the preferred PE within that core,
which helps keep its sibling idle and preserve the uncontended state whenever
possible.

Once every usable physical core already has an active PE, any additional work
invitably introduces SMT contention. At that point, the effective capacity
becomes sibling-state-dependent and neither SD_ASYM_CPUCAPACITY nor a combined
static asym-packing priority can accurately model it.

> 
> Task fitting:
> We consider two tasks with util=400 to fit on two capacity=1000 PEs, even
> though once both PEs are active neither may have anything close to capacity
> 1000 available. In other words, the capacity used for fitting doesn't account
> for the capacity "stolen" by activating the sibling.

Correct, util_fits_cpu() doesn't reduce capacity merely because the sibling is
busy. The scheduler handles this through the SD_SHARE_CPUCAPACITY topology,
idle-core selection and SMT balancing, which tries to move work from a busy SMT
core to an idle core when possible. It doesn't provide a dynamic numerical
capacity for each PE.

But the same limitation remains with the combined asym-packing. Once both
siblings must be used, neither static priority describes how the core resources
are partitioned.

> 
> Uclamp:
> Isn't uclamp, and particularly its bucket implementation, fundamentally a poor
> fit for these platforms in the first place? Even if we tried to represent these
> small capacity differences through uclamp, we'd need something like
> UCLAMP_BUCKETS_COUNT=512 or 1024 to get useful resolution. We currently limit
> it to 20, and for good reason: the overhead.

Yeah, the uclamp buckets are used to aggregate runnable-task clamps on a
runqueue, they don't encode CPU capacity classes. So it's a different story.

> 
> Misfit handling:
> This seems problematic for essentially the same reason as task fitting. A task
> can be classified as fitting while the core is in one-thread mode, then lose a
> substantial fraction of its effective CPU capacity when the sibling becomes
> active, without the static CPU capacity reflecting that change. Conversely,
> migrating it to an otherwise equivalent core and allowing that core to return
> to one-thread mode changes the effective capacity (and therefore utilization)
> again.

Yes, misfit handling compares a task against the CPU's standalone capacity, it
doesn't dynamically reduce that capacity when an SMT sibling becomes busy. That
is true for regular SMT as well, and sibling contention is handled separately by
the SMT balancing logic. The combined asym-packing priority doesn't change this,
it orders CPUs but doesn't make capacity depend on sibling state.

> 
> I'm assuming the CPU_CYCLES counter advancement isn't affected by the
> one-thread/two-thread mode transition?

My understanding is that the core counter continues to advance according to the
PE clock while the PE is active. The mode transition doesn't change the clock
frequency, so the AMU ratio will not reflect the loss of issue/cache/vector
resources.

So, yes, you are right that the existing capacity model does not fully describe
SMT interference. This is probably a broader dynamic-SMT capacity issue and
neither of the policies discussed here models it explicitly.

That said, this series achieves the intended result for the GEMM benchmark (with
similar results observed also for other CPU-intensive workloads): with SMT off,
running one CPU-intensive task per physical core reaches the same ~10 TFLOP/s as
the patched kernel with SMT enabled and the same number of tasks. So the
scheduler now appears to select the preferred PE consistently and avoid the
unwanted resource-mode transitions.

> 
> > 
> > Also, encoding the combined priority alone would not fix the problem addressed
> > by patch 2: the idle-selection paths currently do not consult asymmetric SMT
> > priority. They can still return an arbitrary idle sibling regardless of how
> > arch_asym_cpu_priority() is defined. Patch 2 adds that missing behavior and
> > scopes it to the shared-capacity SMT domain.
> 
> Sure, patch 2 is a different story altogether.

Ok.

> 
> > 
> >> I had suggested this a while ago, did you have a stab at that by any chance,
> >> too?
> > 
> > I tested your CPPC-based asym-packing series, but not this particular
> > combined-priority variant. IIUC the earlier proposal was replacing
> > capacity-aware scheduling for minor physical-core capacity differences, SMT
> > sibling ordering looks like an orthogonal problem.
> > 
> > And at the time, the combined SMT-aware SD_ASYM_CPUCAPACITY approach also gave
> > the best Vera results of the alternatives I tested, which is another reason I
> > kept physical-core capacity selection separate here.
> > 
> >> Am I missing something altogether?
> > 
> > Combining the priorities is a valid experiment, but I'm not sure if it
> > completely solves the problem by itself, I'll give it a try and share the
> > results.
> 
> Thanks again, i'll have a look and give it some more thoughts myself.

Thanks!
-Andrea
